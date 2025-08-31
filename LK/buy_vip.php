<?php
session_start();
require_once 'config.php';

if (!isset($_SESSION['playerid'])) {
    header("Location: login.php");
    exit();
}

$playerid = $_SESSION['playerid'];

// Проверка, является ли запрос POST
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['level'])) {
    $level = (int)$_POST['level'];
    if ($level < 1 || $level > 5) {
        header("Location: index.php?status=error&message=Неверный уровень VIP");
        exit();
    }

    // Массив цен VIP, соответствующий отображаемым значениям
    $vipPrices = [3300, 6600, 9900, 13200, 16500];
    $price = $vipPrices[$level - 1]; // Например, для VIP 5 это $vipPrices[4] = 16500
    $days = 30; // Срок действия в днях

    // Получение текущих данных игрока
    $stmt = $conn->prepare("SELECT EPoint, donorlevel, donat_time FROM players WHERE playerid = :playerid");
    $stmt->execute(['playerid' => $playerid]);
    $player = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($player === false) {
        header("Location: index.php?status=error&message=Игрок не найден");
        exit();
    }

    if ($player['EPoint'] < $price) {
        header("Location: index.php?status=error&message=Недостаточно EPoint для покупки");
        exit();
    }

    // Вычисление новой даты окончания VIP
    $currentDonatTime = $player['donat_time'] ? new DateTime($player['donat_time']) : new DateTime();
    if ($currentDonatTime > new DateTime() && $player['donorlevel'] == $level) {
        $currentDonatTime->modify("+{$days} days");
    } else {
        $currentDonatTime = new DateTime();
        $currentDonatTime->modify("+{$days} days");
    }
    $newDonatTime = $currentDonatTime->format('Y-m-d H:i:s');

    // Обновление данных игрока
    $newEPoint = $player['EPoint'] - $price;
    $stmt = $conn->prepare("
        UPDATE players 
        SET donorlevel = :level, donat_time = :donat_time, EPoint = :epoint 
        WHERE playerid = :playerid
    ");
    $stmt->execute([
        'level' => $level,
        'donat_time' => $newDonatTime,
        'epoint' => $newEPoint,
        'playerid' => $playerid
    ]);

    // Логирование для отладки
    error_log("VIP $level purchased by $playerid. Price: $price EPoint. New balance: $newEPoint");

    header("Location: index.php?status=success&message=VIP уровень $level успешно приобретен!");
    exit();
}

header("Location: index.php");
exit();
?>