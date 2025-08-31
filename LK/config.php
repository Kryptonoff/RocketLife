<?php
$host = "62.122.215.251";
$user = "rocketrplk";
$password = "0176483AsD";
$database = "altislife";

try {
    $conn = new PDO("mysql:host=$host;dbname=$database;charset=utf8mb4", $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>