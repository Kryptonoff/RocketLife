<?php
session_start();
require_once 'config.php';

if (!isset($_SESSION['playerid'])) {
    header("Location: login.php");
    exit();
}

$playerid = $_SESSION['playerid'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['epoint_to_convert'])) {
    $epointToConvert = (int)trim($_POST['epoint_to_convert']);
    $conversionRate = 106.06; // Стоимость 1 EPoint в долларах (700,000 / 6600)

    // Валидация ввода
    if ($epointToConvert <= 0) {
        header("Location: index.php?status=error&message=Количество EPoint должно быть положительным");
        exit();
    }

    // Получение текущих данных игрока
    $stmt = $conn->prepare("SELECT EPoint, bankacc FROM players WHERE playerid = :playerid");
    $stmt->execute(['playerid' => $playerid]);
    $player = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($player === false) {
        header("Location: index.php?status=error&message=Игрок не найден");
        exit();
    }

    $currentEpoint = (int)$player['EPoint'];
    $currentBankacc = (int)$player['bankacc'];

    if ($currentEpoint < $epointToConvert) {
        header("Location: index.php?status=error&message=Недостаточно EPoint для конвертации");
        exit();
    }

    // Расчет конвертации
    $bankaccToAdd = floor($epointToConvert * $conversionRate); // Округляем вниз для целых чисел
    $newEpoint = $currentEpoint - $epointToConvert;
    $newBankacc = $currentBankacc + $bankaccToAdd;

    // Обновление данных игрока
    $stmt = $conn->prepare("UPDATE players SET EPoint = :epoint, bankacc = :bankacc WHERE playerid = :playerid");
    $stmt->execute([
        'epoint' => $newEpoint,
        'bankacc' => $newBankacc,
        'playerid' => $playerid
    ]);

    header("Location: index.php?status=success&message=Конвертация успешна! Получено " . number_format($bankaccToAdd) . " $");
    exit();
}

header("Location: index.php");
exit();
?>