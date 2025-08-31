<?php
require_once 'config.php';

if (isset($_GET['query'])) {
    $query = trim($_GET['query']);
    $stmt = $conn->prepare("SELECT playerid, first_name, nick_name, last_name FROM players WHERE name LIKE :query OR playerid LIKE :playerid LIMIT 5");
    $stmt->execute(['query' => "%$query%", 'playerid' => "%$query%"]);
    $players = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $suggestions = [];
    foreach ($players as $player) {
        $fullName = htmlspecialchars($player['first_name'] . ' "' . $player['nick_name'] . '" ' . $player['last_name']);
        $suggestions[] = [
            'name' => $fullName,
            'playerid' => $player['playerid']
        ];
    }

    header('Content-Type: application/json');
    echo json_encode($suggestions);
    exit();
}
?>