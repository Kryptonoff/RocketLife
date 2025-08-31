<?php
session_start();
require_once 'config.php';

if (!isset($_SESSION['playerid'])) {
    header("Location: login.php");
    exit();
}

$playerid = $_SESSION['playerid'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['new_nickname'])) {
    $newNickname = trim($_POST['new_nickname']);
    $price = 3300;

    if (empty($newNickname) || strlen($newNickname) > 64) {
        header("Location: index.php?status=error&message=Неверный никнейм");
        exit();
    }

    // Получение текущих данных игрока
    $stmt = $conn->prepare("SELECT EPoint FROM players WHERE playerid = :playerid");
    $stmt->execute(['playerid' => $playerid]);
    $player = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($player['EPoint'] < $price) {
        header("Location: index.php?status=error&message=Недостаточно EPoint для смены ника");
        exit();
    }

    // Обновление ника и вычитание EPoint
    $newEPoint = $player['EPoint'] - $price;
    $stmt = $conn->prepare("UPDATE players SET nick_name = :nick_name, EPoint = :epoint WHERE playerid = :playerid");
    $stmt->execute([
        'nick_name' => $newNickname,
        'epoint' => $newEPoint,
        'playerid' => $playerid
    ]);

    header("Location: index.php?status=success&message=Ник успешно изменён на $newNickname!");
    exit();
}

header("Location: index.php");
exit();
?>