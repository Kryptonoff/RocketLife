<?php
session_start();
require_once 'config.php';
require_once 'openid.php';

// Проверка времени жизни сессии (30 минут)
if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > 1800)) {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}
$_SESSION['last_activity'] = time();

// Проверка, закрыт ли личный кабинет на техработы
$maintenanceFile = 'maintenance.txt';
$maintenanceMode = file_exists($maintenanceFile);

if (!isset($_SESSION['playerid'])) {
    header("Location: login.php");
    exit();
}

// Проверка adminlevel игрока
$playerid = $_SESSION['playerid'] ?? null;
if (!$playerid) {
    session_unset();
    session_destroy();
    header("Location: login.php?status=error&message=Сессия недействительна");
    exit();
}

$stmt = $conn->prepare("SELECT adminlevel, donorlevel, donat_time FROM players WHERE playerid = :playerid");
$stmt->execute(['playerid' => $playerid]);
$player = $stmt->fetch(PDO::FETCH_ASSOC);

if ($player === false) {
    session_unset();
    session_destroy();
    header("Location: login.php?status=error&message=Игрок не найден");
    exit();
}

// Устанавливаем значения по умолчанию, если данные отсутствуют
$player['adminlevel'] = $player['adminlevel'] ?? '0';
$player['donorlevel'] = $player['donorlevel'] ?? '0';
$player['donat_time'] = $player['donat_time'] ?? null;

$isAdmin = $player['adminlevel'] == '5';

// Если включен режим техработ и игрок не админ, показываем страницу техработ
if ($maintenanceMode && !$isAdmin) {
    ?>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RocketLife - RPG</title>
        <link rel="icon" type="image/png" href="logo.png">
        <link rel="apple-touch-icon" href="logo.png">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #8f7fd5;
                --primary-hover: #7b6bb3;
                --background-light: #f8f9fd;
                --background-dark: #edebf5;
                --text-primary: #2d2d2d;
                --text-secondary: #6b7280;
                --card-bg: rgba(255, 255, 255, 0.9);
                --shadow: 0 6px 20px rgba(0, 0, 0, 0.06);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Inter', sans-serif;
            }

            body {
                background: linear-gradient(145deg, var(--background-light) 0%, var(--background-dark) 100%);
                color: var(--text-primary);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .maintenance-container {
                background: var(--card-bg);
                padding: 40px;
                border-radius: 12px;
                box-shadow: var(--shadow);
                text-align: center;
                max-width: 500px;
                width: 100%;
                backdrop-filter: blur(10px);
            }

            .maintenance-container i {
                font-size: 48px;
                color: var(--primary-color);
                margin-bottom: 20px;
            }

            .maintenance-container h1 {
                font-size: 24px;
                font-weight: 600;
                color: var(--primary-color);
                margin-bottom: 10px;
            }

            .maintenance-container p {
                font-size: 14px;
                color: var(--text-secondary);
                margin-bottom: 20px;
            }

            .maintenance-container .logo {
                margin-top: 20px;
            }

            .maintenance-container .logo img {
                height: 40px;
            }
        </style>
    </head>
    <body>
        <div class="maintenance-container">
            <i class="fas fa-tools"></i>
            <h1>Технические работы</h1>
            <p>Личный кабинет временно закрыт на техническое обслуживание. Пожалуйста, попробуйте зайти позже.</p>
            <div class="logo">
                <img src="logo.png" alt="RocketLife Logo">
            </div>
        </div>
    </body>
    </html>
    <?php
    exit();
}

// Функция для экранирования данных
function escape($data) {
    return htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
}

// Функция для форматирования времени (из секунд в часы или минуты)
function formatTimePlayed($minutes) {
    if ($minutes === null || $minutes <= 0) {
        return 'Н/Д';
    }

    $hours = floor($minutes / 60);
    $remainingMinutes = $minutes % 60;

    $hourString = '';
    if ($hours > 0) {
        if ($hours % 10 == 1 && $hours % 100 != 11) {
            $hourWord = 'час';
        } elseif (in_array($hours % 10, [2, 3, 4]) && !in_array($hours % 100, [12, 13, 14])) {
            $hourWord = 'часа';
        } else {
            $hourWord = 'часов';
        }
        $hourString = "$hours $hourWord";
    }

    $minuteString = '';
    if ($remainingMinutes > 0) {
        if ($remainingMinutes % 10 == 1 && $remainingMinutes % 100 != 11) {
            $minuteWord = 'минута';
        } elseif (in_array($remainingMinutes % 10, [2, 3, 4]) && !in_array($remainingMinutes % 100, [12, 13, 14])) {
            $minuteWord = 'минуты';
        } else {
            $minuteWord = 'минут';
        }
        $minuteString = "$remainingMinutes $minuteWord";
    }

    if ($hours == 0 && $remainingMinutes == 0) {
        return 'менее минуты';
    }

    return trim("$hourString $minuteString");
}

// Функция для форматирования даты
function formatDate($date) {
    if (!$date) {
        return 'Н/Д';
    }
    return date('d.m.Y H:i', strtotime($date));
}

// Функция для получения данных игрока
// Функция для получения данных игрока
function getPlayerData($conn, $playerid) {
    $stmt = $conn->prepare("
        SELECT first_name, nick_name, last_name, cash, bankacc, EPoint, side, dcash, 
               connected, total_time, last_connected, insert_time, secret_key 
        FROM players 
        WHERE playerid = :playerid
    ");
    $stmt->execute(['playerid' => $playerid]);
    $player = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$player) {
        session_destroy();
        header("Location: login.php");
        exit();
    }

    $stmt = $conn->prepare("SELECT hunger, thirst, trunk FROM player_data WHERE uid = :playerid");
    $stmt->execute(['playerid' => $playerid]);
    $playerData = $stmt->fetch(PDO::FETCH_ASSOC);

    $trxCount = 0;
    if ($playerData && !empty($playerData['trunk'])) {
        $trunk = json_decode($playerData['trunk'], true);
        if (!empty($trunk)) {
            foreach ($trunk as $item) {
                if ($item[0] === 'RRP_Mineral') {
                    $trxCount = $item[1];
                    break;
                }
            }
        }
    }

    $slotColor = '';
    $slotName = '';
    switch ($player['side']) {
        case 'civ':
            $slotColor = '#a78bfa';
            $slotName = 'Гражданский';
            break;
        case 'med':
            $slotColor = '#f87171';
            $slotName = 'Медик';
            break;
        case 'cop':
            $slotColor = '#60a5fa';
            $slotName = 'Полицейский';
            break;
        case 'reb':
            $slotColor = '#4ade80';
            $slotName = 'Повстанец';
            break;
        default:
            $slotColor = '#a78bfa';
            $slotName = 'Неизвестно';
    }

    return [
        'first_name' => escape($player['first_name']),
        'nick_name' => escape($player['nick_name']),
        'last_name' => escape($player['last_name']),
        'full_name' => escape($player['first_name'] . ' "' . $player['nick_name'] . '" ' . $player['last_name']),
        'cash' => isset($player['cash']) ? number_format($player['cash']) . ' $' : 'Н/Д',
        'cash_raw' => isset($player['cash']) ? (int)$player['cash'] : 0,
        'bankacc' => isset($player['bankacc']) ? number_format($player['bankacc']) . ' $' : 'Н/Д',
        'bankacc_raw' => isset($player['bankacc']) ? (int)$player['bankacc'] : 0,
        'epoint' => isset($player['EPoint']) ? number_format($player['EPoint']) . ' EPoint' : 'Н/Д',
        'epoint_raw' => isset($player['EPoint']) ? (int)$player['EPoint'] : 0,
        'dcash' => isset($player['dcash']) ? number_format($player['dcash']) . ' $' : 'Н/Д',
        'dcash_raw' => isset($player['dcash']) ? (int)$player['dcash'] : 0,
        'hunger' => $playerData ? $playerData['hunger'] : 0,
        'thirst' => $playerData ? $playerData['thirst'] : 0,
        'trx' => $trxCount,
        'trx_raw' => $trxCount,
        'side' => escape($player['side']),
        'slot_color' => $slotColor,
        'slot_name' => $slotName,
        'connected' => isset($player['connected']) ? ($player['connected'] == 1 ? 'На острове' : 'Нет на острове') : 'Н/Д',
        'total_time' => isset($player['total_time']) ? formatTimePlayed($player['total_time']) : 'Н/Д',
        'last_connected' => isset($player['last_connected']) ? formatDate($player['last_connected']) : 'Н/Д',
        'insert_time' => isset($player['insert_time']) ? formatDate($player['insert_time']) : 'Н/Д',
        'secret_key' => escape($player['secret_key'] ?? 'Не создан')
    ];
}

// Функция для получения статистики
function getStats($conn) {
    $statsStmt = $conn->query("
        SELECT 
            (SELECT COUNT(*) FROM players) as total_players,
            (SELECT COUNT(*) FROM vehicles) as total_vehicles,
            (SELECT COUNT(*) FROM houses) as total_houses
    ");
    $stats = $statsStmt->fetch(PDO::FETCH_ASSOC);
    return [
        'total_players' => number_format($stats['total_players']),
        'total_vehicles' => number_format($stats['total_vehicles']),
        'total_houses' => number_format($stats['total_houses'])
    ];
}

// Функция для экономической статистики
function getEconomicStats($conn) {
    $stmt = $conn->query("SELECT (cash + bankacc) as total_wealth FROM players WHERE cash IS NOT NULL AND bankacc IS NOT NULL");
    $wealthData = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if (empty($wealthData)) {
        return [
            'richest_wealth' => 'Н/Д',
            'poverty_line' => 'Н/Д',
            'average_income' => 'Н/Д'
        ];
    }

    $richestWealth = max($wealthData);
    sort($wealthData);
    $count = count($wealthData);
    if ($count % 2 == 0) {
        $median = ($wealthData[$count / 2 - 1] + $wealthData[$count / 2]) / 2;
    } else {
        $median = $wealthData[floor($count / 2)];
    }
    $povertyLine = $median * 0.5;
    $averageIncome = array_sum($wealthData) / $count;

    return [
        'richest_wealth' => number_format($richestWealth) . ' $',
        'poverty_line' => number_format($povertyLine) . ' $',
        'average_income' => number_format($averageIncome) . ' $'
    ];
}

// Функция для получения аватара и профиля Steam через Steam API
function getSteamProfile($playerid) {
    $steamApiKey = 'A8B170C3B1572D34E178C0CCE1FCA4E6';
    $steamProfileUrl = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=$steamApiKey&steamids=$playerid";
    try {
        $steamProfileData = @file_get_contents($steamProfileUrl);
        if ($steamProfileData === false) {
            return [
                'avatar' => 'https://via.placeholder.com/128',
                'profile_url' => '#'
            ];
        }
        $steamProfile = json_decode($steamProfileData, true);
        return [
            'avatar' => $steamProfile['response']['players'][0]['avatarfull'] ?? 'https://via.placeholder.com/128',
            'profile_url' => $steamProfile['response']['players'][0]['profileurl'] ?? '#'
        ];
    } catch (Exception $e) {
        return [
            'avatar' => 'https://via.placeholder.com/128',
            'profile_url' => '#'
        ];
    }
}

// Функция для получения техники игрока
function getPlayerVehicles($conn, $playerid) {
    $stmt = $conn->prepare("
        SELECT v.*, m.displayName 
        FROM vehicles v 
        LEFT JOIN lk_mapobjects m ON v.classname = m.classname 
        WHERE v.pid = :playerid AND v.alive = 1
    ");
    $stmt->execute(['playerid' => $playerid]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Функция для форматирования инвентаря с учетом localize из economyv2
function formatInventory($inventory, $economyResources) {
    $inventoryData = json_decode($inventory, true);
    if (!$inventoryData || !isset($inventoryData[0]) || empty($inventoryData[0])) {
        return 'Пусто';
    }

    $items = $inventoryData[0];
    $result = [];

    $resourceMap = [];
    if (!empty($economyResources)) {
        foreach ($economyResources as $resource) {
            if (isset($resource['classname']) && !empty($resource['classname']) && isset($resource['localize'])) {
                $resourceMap[$resource['classname']] = $resource['localize'];
            }
        }
    }

    foreach ($items as $item) {
        $classname = $item[0];
        $quantity = $item[1];
        $name = isset($resourceMap[$classname]) ? $resourceMap[$classname] : $classname;
        $result[] = "$name: $quantity";
    }
    return implode(', ', $result);
}

// Функция для определения иконки ресурса на основе названия
function getResourceIcon($localize, $isLegal) {
    $localizeLower = mb_strtolower($localize);

    if ($isLegal) {
        if (stripos($localizeLower, 'медикамент') !== false || stripos($localizeLower, 'аптечк') !== false) {
            return 'fa-medkit';
        } elseif (stripos($localizeLower, 'хлеб') !== false || stripos($localizeLower, 'еда') !== false || stripos($localizeLower, 'фрукт') !== false || stripos($localizeLower, 'овощ') !== false) {
            return 'fa-apple-alt';
        } elseif (stripos($localizeLower, 'вода') !== false) {
            return 'fa-tint';
        } elseif (stripos($localizeLower, 'дерево') !== false || stripos($localizeLower, 'древесин') !== false) {
            return 'fa-tree';
        } elseif (stripos($localizeLower, 'металл') !== false || stripos($localizeLower, 'руда') !== false) {
            return 'fa-gem';
        } elseif (stripos($localizeLower, 'топливо') !== false) {
            return 'fa-gas-pump';
        } else {
            return 'fa-box';
        }
    } else {
        if (stripos($localizeLower, 'марихуан') !== false || stripos($localizeLower, 'кокаин') !== false || stripos($localizeLower, 'наркотик') !== false) {
            return 'fa-cannabis';
        } elseif (stripos($localizeLower, 'оружие') !== false || stripos($localizeLower, 'пистолет') !== false || stripos($localizeLower, 'автомат') !== false) {
            return 'fa-gun';
        } elseif (stripos($localizeLower, 'взрывчатка') !== false || stripos($localizeLower, 'динамит') !== false) {
            return 'fa-bomb';
        } elseif (stripos($localizeLower, 'контрабанда') !== false) {
            return 'fa-suitcase';
        } else {
            return 'fa-ban';
        }
    }
}

// Обработка действий админ-панели
$adminMessage = '';
if ($isAdmin && $_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['toggle_maintenance'])) {
        if ($maintenanceMode) {
            unlink($maintenanceFile);
            $adminMessage = "Режим технических работ отключен.";
        } else {
            file_put_contents($maintenanceFile, 'Maintenance mode enabled');
            $adminMessage = "Режим технических работ включен.";
        }
        $maintenanceMode = !$maintenanceMode;
    }
}

// Получение данных
$playerData = getPlayerData($conn, $playerid);
$stats = getStats($conn);
$economicStats = getEconomicStats($conn);
$steamProfile = getSteamProfile($playerid);

$economyStmt = $conn->prepare("SELECT * FROM economyv2 ORDER BY legal DESC, localize");
$economyStmt->execute();
$economyResources = $economyStmt->fetchAll(PDO::FETCH_ASSOC);

$legalResources = array_filter($economyResources, fn($resource) => $resource['legal']);
$illegalResources = array_filter($economyResources, fn($resource) => !$resource['legal']);

$vehicles = getPlayerVehicles($conn, $playerid);
$totalVehicles = count($vehicles);

$totalResources = $playerData['cash_raw'] + $playerData['bankacc_raw'] + $playerData['epoint_raw'] + $playerData['trx_raw'] + $playerData['dcash_raw'];
$cashPercent = $totalResources > 0 ? ($playerData['cash_raw'] / $totalResources) * 100 : 0;
$bankPercent = $totalResources > 0 ? ($playerData['bankacc_raw'] / $totalResources) * 100 : 0;
$epointPercent = $totalResources > 0 ? ($playerData['epoint_raw'] / $totalResources) * 100 : 0;
$trxPercent = $totalResources > 0 ? ($playerData['trx_raw'] / $totalResources) * 100 : 0;
$dcashPercent = $totalResources > 0 ? ($playerData['dcash_raw'] / $totalResources) * 100 : 0;
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RocketLife - RPG</title>
    <link rel="icon" type="image/png" href="logo.png">
    <link rel="apple-touch-icon" href="logo.png">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
		/* Остальные стили остаются без изменений */
		.services-grid {
			display: grid;
			grid-template-columns: repeat(2, minmax(0, 400px)); /* Фиксированная ширина колонок */
			justify-content: center; /* Центрирование колонок в контейнере */
			gap: 20px;
			margin-top: 20px;
		}

		.services-grid .name-change-card {
			width: 100%;
			max-width: 400px; /* Ограничение ширины карточек */
			margin: 0 auto; /* Центрирование карточек внутри колонок */
		}
		.services-container {
			width: 100%;
			padding: 20px;
			background: var(--card-bg);
			border-radius: 12px;
			box-shadow: var(--shadow);
			backdrop-filter: blur(10px);
		}

		.services-container h3 {
			font-size: 20px;
			font-weight: 600;
			color: var(--primary-color);
			margin-bottom: 20px;
			text-align: center;
		}

		.vip-cards {
			display: grid;
			grid-template-columns: repeat(5, 1fr); /* Фиксируем 5 колонок */
			gap: 20px;
			margin-top: 20px;
			margin-bottom: 40px;
			max-width: 100%; /* Убираем лишнее пространство */
		}

		.vip-card {
			background: var(--vehicle-card-bg);
			border-radius: 12px;
			padding: 16px;
			box-shadow: var(--vehicle-card-shadow);
			transition: all 0.3s ease;
			border: 1px solid rgba(0, 0, 0, 0.05);
		}

		.vip-card:hover {
			transform: translateY(-5px);
			box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
		}

		.vip-card-header {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: 12px;
			padding-bottom: 12px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.05);
		}

		.vip-card-title {
			font-size: 16px;
			font-weight: 600;
			color: var(--primary-color);
		}

		.vip-card-status {
			font-size: 12px;
			font-weight: 500;
			padding: 4px 8px;
			border-radius: 12px;
		}

		.status-active {
			background-color: rgba(52, 199, 89, 0.1);
			color: var(--success);
		}

		.status-inactive {
			background-color: rgba(143, 127, 213, 0.1);
			color: var(--primary-color);
		}

		.vip-card-details {
			display: grid;
			grid-template-columns: repeat(2, 1fr);
			gap: 12px;
			margin-bottom: 12px;
		}

		.vip-card-detail {
			display: flex;
			flex-direction: column;
		}

		.detail-label {
			font-size: 12px;
			color: var(--text-secondary);
			margin-bottom: 4px;
		}

		.detail-value {
			font-size: 14px;
			font-weight: 500;
			color: var(--text-primary);
		}

		.vip-card-footer {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-top: 12px;
			padding-top: 12px;
			border-top: 1px solid rgba(0, 0, 0, 0.05);
			width: 100%;
		}

		.vip-button-form {
			display: inline-flex;
			margin: 0;
			padding: 0;
		}

		.vip-card-btn {
			background: var(--primary-color);
			color: #fff;
			padding: 8px 16px;
			border: none;
			border-radius: 8px;
			font-size: 14px;
			font-weight: 500;
			cursor: pointer;
			transition: background 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
		}

		.vip-card-btn:hover {
			background: var(--primary-hover);
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(143, 127, 213, 0.3);
		}

		.vip-card-expiry {
			font-size: 12px;
			font-weight: 500;
			color: var(--success);
		}

		.vip-card-insufficient {
			font-size: 12px;
			font-weight: 500;
			color: var(--danger);
		}

		/* Стили для смены данных остаются без изменений */
		.name-change-container {
			display: flex;
			justify-content: center;
			margin-top: 40px;
		}

		.name-change-card {
			background: var(--card-bg);
			border-radius: 12px;
			padding: 20px;
			box-shadow: var(--shadow);
			width: 100%;
			max-width: 400px;
			transition: transform 0.3s ease, box-shadow 0.3s ease;
			border: 1px solid rgba(143, 127, 213, 0.1);
		}

		.name-change-card:hover {
			transform: translateY(-5px);
			box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
		}

		.name-change-header {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: 16px;
			padding-bottom: 12px;
			border-bottom: 1px solid rgba(0, 0, 0, 0.05);
		}

		.name-change-header h4 {
			font-size: 18px;
			font-weight: 600;
			color: var(--primary-color);
		}

		.name-change-icon i {
			font-size: 24px;
			color: var(--primary-color);
		}

		.name-change-body {
			text-align: center;
		}

		.name-change-body p {
			font-size: 14px;
			color: var(--text-secondary);
			margin-bottom: 12px;
		}

		.name-change-body p span {
			font-weight: 500;
			color: var(--primary-color);
		}

		.name-input {
			margin-bottom: 16px;
		}

		.name-input input {
			width: 100%;
			padding: 10px;
			border: 1px solid rgba(143, 127, 213, 0.3);
			border-radius: 8px;
			font-size: 14px;
			color: var(--text-primary);
			background: rgba(255, 255, 255, 0.9);
			transition: border-color 0.3s ease;
		}

		.name-input input:focus {
			border-color: var(--primary-color);
			outline: none;
		}

		.name-change-btn {
			background: var(--primary-color);
			color: #fff;
			padding: 10px 20px;
			border: none;
			border-radius: 8px;
			font-size: 14px;
			font-weight: 500;
			cursor: pointer;
			transition: background 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
		}

		.name-change-btn:hover {
			background: var(--primary-hover);
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(143, 127, 213, 0.3);
		}

		.name-insufficient {
			font-size: 12px;
			font-weight: 500;
			color: var(--danger);
		}

		/* Адаптивность */
		@media (max-width: 1200px) {
			.vip-cards {
				grid-template-columns: repeat(3, 1fr); /* На средних экранах 3 карточки */
			}
		}

		@media (max-width: 768px) {
			.vip-cards {
				grid-template-columns: repeat(2, 1fr); /* На узких экранах 2 карточки */
			}

			.name-change-card {
				max-width: 100%;
			}
		}

		@media (max-width: 480px) {
			.vip-cards {
				grid-template-columns: 1fr; /* На очень узких экранах 1 карточка */
			}

			.vip-card-details {
				grid-template-columns: 1fr;
			}
		}
        :root {
            --primary-color: #8f7fd5;
            --primary-hover: #7b6bb3;
            --background-light: #f8f9fd;
            --background-dark: #edebf5;
            --text-primary: #2d2d2d;
            --text-secondary: #6b7280;
            --card-bg: rgba(255, 255, 255, 0.9);
            --shadow: 0 6px 20px rgba(0, 0, 0, 0.06);
            --success: #34c759;
            --danger: #ff3b30;
            --warning: #facc15;
            --hunger-color: #f4a261;
            --thirst-color: #60a5fa;
            --notification-error: #f87171;
            --notification-info: #60a5fa;
            --notification-success: #4ade80;
            --cash-color: #4ade80;
            --bank-color: #60a5fa;
            --epoint-color: #f4a261;
            --trx-color: #ff6b6b;
            --dcash-color: #a78bfa;
            --vehicle-card-bg: rgba(255, 255, 255, 0.95);
            --vehicle-card-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        body {
            background: linear-gradient(145deg, var(--background-light) 0%, var(--background-dark) 100%);
            color: var(--text-primary);
            min-height: 100vh;
            overflow: hidden;
        }

        .sidebar::-webkit-scrollbar,
        .tab-content::-webkit-scrollbar {
            width: 8px;
        }

        .sidebar::-webkit-scrollbar-track,
        .tab-content::-webkit-scrollbar-track {
            background: transparent;
        }

        .sidebar::-webkit-scrollbar-thumb,
        .tab-content::-webkit-scrollbar-thumb {
            background: rgba(143, 127, 213, 0.3);
            border-radius: 10px;
        }

        .sidebar::-webkit-scrollbar-thumb:hover,
        .tab-content::-webkit-scrollbar-thumb:hover {
            background: var(--primary-hover);
        }

        .nav-bar {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            padding: 16px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid rgba(0, 0, 0, 0.03);
        }

        .nav-bar .logo {
            margin-left: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
            transition: transform 0.3s ease;
        }

        .nav-bar .logo:hover {
            transform: scale(1.02);
        }

        .nav-bar .logo img {
            height: 40px;
        }

        .nav-bar .logo .logo-text {
            font-size: 18px;
            font-weight: 600;
            color: var(--primary-color);
            letter-spacing: 0.5px;
        }

        .user-profile {
            position: relative;
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            padding: 8px 12px;
            border-radius: 20px;
            background: rgba(143, 127, 213, 0.05);
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .user-profile:hover {
            background: rgba(143, 127, 213, 0.1);
            transform: translateY(-2px);
        }

        .user-profile img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 2px solid var(--primary-color);
            transition: transform 0.3s ease;
        }

        .user-profile:hover img {
            transform: scale(1.05);
        }

        .user-profile .nickname {
            font-size: 14px;
            font-weight: 500;
            color: var(--text-primary);
        }

        .user-profile .nickname::after {
            content: '▼';
            font-size: 10px;
            margin-left: 6px;
            color: var(--primary-color);
            transition: transform 0.3s ease;
        }

        .user-profile.active .nickname::after {
            content: '▲';
            transform: rotate(180deg);
        }

        .dropdown {
            position: absolute;
            top: calc(100% + 8px);
            right: 0;
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: var(--shadow);
            min-width: 120px;
            opacity: 0;
            visibility: hidden;
            transform: translateY(10px);
            transition: all 0.3s ease;
            z-index: 1001;
            border: 1px solid rgba(143, 127, 213, 0.1);
        }

        .dropdown.active {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }

        .dropdown .logout-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 10px 14px;
            color: var(--text-primary);
            background: transparent;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            transition: background 0.3s ease, color 0.3s ease, transform 0.3s ease;
        }

        .dropdown .logout-btn:hover {
            background: rgba(143, 127, 213, 0.1);
            color: var(--primary-color);
            transform: translateY(-2px);
        }

        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 12px 20px;
            border-radius: 8px;
            color: #fff;
            font-size: 14px;
            font-weight: 500;
            box-shadow: var(--shadow);
            z-index: 1002;
            display: flex;
            align-items: center;
            gap: 8px;
            opacity: 0;
            transform: translateY(-20px);
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .notification.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .notification.error {
            background: var(--notification-error);
        }

        .notification.info {
            background: var(--notification-info);
        }

        .notification.success {
            background: var(--notification-success);
        }

        .notification i {
            font-size: 16px;
        }

        .sidebar {
            width: 220px;
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            padding: 24px 12px;
            height: calc(100vh - 72px);
            position: fixed;
            left: 0;
            top: 72px;
            z-index: 999;
            border-right: 1px solid rgba(0, 0, 0, 0.03);
            overflow-y: auto;
        }

        .sidebar .sidebar-profile {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar .sidebar-profile img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 3px solid var(--primary-color);
            margin-bottom: 10px;
            transition: transform 0.3s ease;
        }

        .sidebar .sidebar-profile img:hover {
            transform: scale(1.05);
        }

        .sidebar .sidebar-profile .nickname {
            font-size: 16px;
            font-weight: 500;
            color: var(--primary-color);
            display: block;
            margin-bottom: 5px;
        }

        .sidebar .sidebar-profile .status {
            font-size: 12px;
            color: var(--text-secondary);
        }

        .sidebar .status.online {
            color: var(--success);
        }

        .sidebar .status.offline {
            color: var(--danger);
        }

        .sidebar .menu-header {
            margin-bottom: 20px;
        }

        .sidebar .menu-header .menu-label {
            font-size: 12px;
            font-weight: 500;
            color: var(--text-secondary);
            background: rgba(143, 127, 213, 0.1);
            padding: 4px 10px;
            border-radius: 10px;
            display: inline-block;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            margin-bottom: 6px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: var(--text-primary);
            font-size: 14px;
            font-weight: 500;
            padding: 10px 14px;
            display: flex;
            align-items: center;
            gap: 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: relative;
        }

        .sidebar ul li a i {
            font-size: 16px;
            color: var(--text-secondary);
            transition: color 0.3s ease;
        }

        .sidebar ul li a:hover,
        .sidebar ul li a.active {
            background: linear-gradient(90deg, rgba(143, 127, 213, 0.1), rgba(255, 111, 145, 0.1));
            color: var(--primary-color);
            animation: pulse 0.5s ease;
        }

        .sidebar ul li a:hover i,
        .sidebar ul li a.active i {
            color: var(--primary-color);
        }

        .sidebar ul li a.active::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            width: 3px;
            height: 100%;
            background: var(--primary-color);
            border-radius: 0 3px 3px 0;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .content {
            margin-left: 220px;
            padding: 20px;
            width: calc(100% - 220px);
            position: relative;
            z-index: 1;
            height: calc(100vh - 72px);
            overflow: hidden;
        }

        .tab-content {
            display: none;
            background: var(--card-bg);
            padding: 24px;
            border-radius: 12px;
            box-shadow: var(--shadow);
            margin-bottom: 20px;
            backdrop-filter: blur(10px);
            max-height: calc(100vh - 120px);
            overflow: auto;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease, transform 0.5s ease;
        }

        .tab-content.active {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }

        .tab-content h2 {
            font-size: 24px;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 14px;
        }

        .grid-item {
            background: var(--card-bg);
            padding: 14px;
            border-radius: 10px;
            box-shadow: var(--shadow);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            backdrop-filter: blur(10px);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .grid-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .grid-item i {
            font-size: 24px;
            color: var(--primary-color);
        }

        .grid-item .stat-text {
            text-align: left;
        }

        .grid-item span {
            font-weight: 600;
            color: var(--primary-color);
            display: block;
            font-size: 16px;
        }

        .grid-item .label {
            font-size: 12px;
            color: var(--text-secondary);
        }

        .economy-main-section {
            margin-top: 20px;
        }

        .economy-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .filter-buttons {
            display: flex;
            gap: 8px;
        }

        .filter-btn {
            background: rgba(143, 127, 213, 0.1);
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            color: var(--text-primary);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .filter-btn:hover {
            background: rgba(143, 127, 213, 0.2);
            transform: translateY(-2px);
        }

        .filter-btn.active {
            background: var(--primary-color);
            color: #fff;
        }

        .sort-buttons {
            display: flex;
            gap: 8px;
        }

        .sort-btn {
            background: rgba(0, 0, 0, 0.05);
            border: none;
            padding: 8px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            color: var(--text-primary);
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            transition: all 0.3s ease;
        }

        .sort-btn:hover {
            background: rgba(143, 127, 213, 0.2);
            transform: translateY(-2px);
        }

        .sort-btn i {
            font-size: 14px;
        }

        .economy-resources {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 12px;
            max-height: 400px;
            overflow-y: auto;
            padding-right: 10px;
        }

        .economy-resources::-webkit-scrollbar {
            width: 8px;
        }

        .economy-resources::-webkit-scrollbar-track {
            background: transparent;
        }

        .economy-resources::-webkit-scrollbar-thumb {
            background: rgba(143, 127, 213, 0.3);
            border-radius: 10px;
        }

        .economy-resources::-webkit-scrollbar-thumb:hover {
            background: var(--primary-hover);
        }

        .resource-card {
            background: var(--card-bg);
            border-radius: 10px;
            padding: 12px;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: all 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.05);
            cursor: pointer;
        }

        .resource-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .resource-card.legal {
            border-left: 4px solid var(--success);
        }

        .resource-card.illegal {
            border-left: 4px solid var(--danger);
        }

        .resource-icon {
            font-size: 24px;
            color: var(--text-secondary);
        }

        .resource-card.legal .resource-icon {
            color: var(--success);
        }

        .resource-card.illegal .resource-icon {
            color: var(--danger);
        }

        .resource-info h3 {
            font-size: 14px;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 4px;
        }

        .resource-info p {
            font-size: 12px;
            color: var(--text-secondary);
        }

        .resource-info p span {
            color: var(--primary-color);
            font-weight: 500;
        }

        .vehicle-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .vehicle-card {
            background: var(--vehicle-card-bg);
            border-radius: 12px;
            padding: 16px;
            box-shadow: var(--vehicle-card-shadow);
            transition: all 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .vehicle-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }

        .vehicle-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            padding-bottom: 12px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .vehicle-card-title {
            font-size: 16px;
            font-weight: 600;
            color: var(--primary-color);
        }

        .vehicle-card-status {
            font-size: 12px;
            font-weight: 500;
            padding: 4px 8px;
            border-radius: 12px;
        }

        .status-active {
            background-color: rgba(52, 199, 89, 0.1);
            color: var(--success);
        }

        .status-inactive {
            background-color: rgba(255, 59, 48, 0.1);
            color: var(--danger);
        }

        .vehicle-card-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            margin-bottom: 12px;
        }

        .vehicle-card-detail {
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            font-size: 12px;
            color: var(--text-secondary);
            margin-bottom: 4px;
        }

        .detail-value {
            font-size: 14px;
            font-weight: 500;
            color: var(--text-primary);
        }

        .vehicle-card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 12px;
            padding-top: 12px;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
        }

        .vehicle-card-price {
            font-size: 14px;
            font-weight: 600;
            color: var(--primary-color);
        }

        .vehicle-card-insurance {
            font-size: 12px;
            font-weight: 500;
            padding: 4px 8px;
            border-radius: 12px;
        }

        .insured-yes {
            background-color: rgba(52, 199, 89, 0.1);
            color: var(--success);
        }

        .insured-no {
            background-color: rgba(255, 59, 48, 0.1);
            color: var(--danger);
        }

        .profile-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .profile-left {
            display: flex;
            flex-direction: column;
            gap: 20px;
            flex: 1;
            min-width: 300px;
            max-width: 380px;
        }

        .profile-right {
            flex: 2;
            min-width: 300px;
        }

        .profile-block {
            background: var(--card-bg);
            padding: 16px;
            border-radius: 10px;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease;
        }

        .profile-block:hover {
            transform: translateY(-3px);
        }

        .profile-block h3 {
            font-size: 18px;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 16px;
            text-align: center;
        }

        .profile-block ul {
            list-style: none;
        }

        .profile-block li {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.03);
            font-size: 14px;
        }

        .profile-block li:last-child {
            border-bottom: none;
        }

        .profile-block li span {
            font-weight: 500;
            color: var(--primary-color);
        }

        .profile-block .avatar-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-block .avatar-container img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 3px solid var(--primary-color);
            transition: transform 0.3s ease;
        }

        .profile-block .avatar-container img:hover {
            transform: scale(1.05);
        }

        .profile-block .steam-nickname {
            display: block;
            font-size: 16px;
            font-weight: 500;
            color: var(--primary-color);
            text-decoration: none;
            margin-top: 10px;
            transition: color 0.3s ease;
        }

        .profile-block .steam-nickname:hover {
            color: var(--primary-hover);
        }

        .profile-block .steam-id {
            display: block;
            font-size: 12px;
            color: var(--text-secondary);
            margin-top: 4px;
            font-weight: 400;
        }

        .slot-indicator {
            position: relative;
            display: inline-block;
            width: 16px;
            height: 16px;
            border-radius: 4px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .slot-indicator:hover {
            transform: scale(1.2);
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
        }

        .slot-indicator .tooltip {
            visibility: hidden;
            width: 120px;
            background-color: var(--primary-color);
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px 0;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            margin-left: -60px;
            opacity: 0;
            transition: opacity 0.3s ease;
            font-size: 12px;
        }

        .slot-indicator:hover .tooltip {
            visibility: visible;
            opacity: 1;
        }

        .slot-indicator .tooltip::after {
            content: '';
            position: absolute;
            top: 100%;
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: var(--primary-color) transparent transparent transparent;
        }

        .character-status {
            background: var(--card-bg);
            padding: 16px;
            border-radius: 10px;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease;
        }

        .character-status:hover {
            transform: translateY(-3px);
        }

        .character-status h3 {
            font-size: 18px;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 16px;
            text-align: center;
        }

        .status-bar {
            margin-bottom: 12px;
        }

        .status-bar label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 4px;
        }

        .progress-bar {
            width: 100%;
            height: 12px;
            background: rgba(0, 0, 0, 0.05);
            border-radius: 6px;
            overflow: hidden;
            position: relative;
        }

        .progress-bar .progress {
            height: 100%;
            transition: width 0.5s ease;
        }

        .progress-bar .progress.hunger {
            background: var(--hunger-color);
        }

        .progress-bar .progress.thirst {
            background: var(--thirst-color);
        }

        .progress-bar .progress-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 10px;
            font-weight: 500;
            color: #000;
            text-shadow: 0 0 2px rgba(255, 255, 255, 0.8);
        }

        .resources-block {
            background: var(--card-bg);
            padding: 16px;
            border-radius: 10px;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .resources-block:hover {
            transform: translateY(-3px);
        }

        .resources-block h3 {
            font-size: 18px;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 16px;
            text-align: center;
        }

        .resources-block ul {
            list-style: none;
            margin-bottom: 20px;
        }

        .resources-block li {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.03);
            font-size: 14px;
        }

        .resources-block li:last-child {
            border-bottom: none;
        }

        .resources-block li span {
            font-weight: 500;
            color: var(--primary-color);
        }

        .resources-chart {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            flex-grow: 1;
        }

        .chart-container {
            position: relative;
            width: 280px;
            height: 280px;
            margin: 0 auto;
            background: transparent;
        }

        .chart-legend {
            margin-top: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            justify-content: center;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            padding: 6px 12px;
            border-radius: 20px;
            background: rgba(0, 0, 0, 0.03);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .legend-item:hover {
            background: rgba(143, 127, 213, 0.1);
            transform: translateY(-2px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .legend-item span {
            width: 14px;
            height: 14px;
            border-radius: 50%;
            display: inline-block;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .legend-item.cash span {
            background: var(--cash-color);
        }

        .legend-item.bank span {
            background: var(--bank-color);
        }

        .legend-item.epoint span {
            background: var(--epoint-color);
        }

        .legend-item.trx span {
            background: var(--trx-color);
        }

        .legend-item.dcash span {
            background: var(--dcash-color);
        }

        .admin-form {
            margin-bottom: 20px;
        }

        .admin-form button {
            background: var(--primary-color);
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .admin-form button:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
        }

        .admin-message {
            background: var(--notification-success);
            color: #fff;
            padding: 12px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .admin-message i {
            font-size: 16px;
        }

        .shop-tabs,
        .profile-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .shop-tab-btn,
        .profile-tab-btn {
            background: rgba(143, 127, 213, 0.1);
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            color: var(--text-primary);
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .shop-tab-btn:hover,
        .profile-tab-btn:hover {
            background: rgba(143, 127, 213, 0.2);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .shop-tab-btn.active,
        .profile-tab-btn.active {
            background: var(--primary-color);
            color: #fff;
            box-shadow: 0 4px 12px rgba(143, 127, 213, 0.3);
        }

        .shop-tab-btn::after,
        .profile-tab-btn::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                90deg,
                transparent,
                rgba(255, 255, 255, 0.2),
                transparent
            );
            transition: 0.5s;
        }

        .shop-tab-btn:hover::after,
        .profile-tab-btn:hover::after {
            left: 100%;
        }

        .shop-content,
        .profile-content {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 20px;
            box-shadow: var(--shadow);
            min-height: 300px;
            display: flex;
            justify-content: center;
            align-items: center;
            backdrop-filter: blur(10px);
        }

        .shop-tab-content,
        .profile-tab-content {
            display: none;
            width: 100%;
        }

        .shop-tab-content.active,
        .profile-tab-content.active {
            display: block;
        }

        .shop-empty-message {
            text-align: center;
            color: var(--text-secondary);
            font-size: 16px;
            font-weight: 500;
        }

        .shop-empty-message i {
            font-size: 48px;
            color: var(--primary-color);
            margin-bottom: 20px;
            display: block;
            transition: transform 0.3s ease;
        }

        .shop-empty-message:hover i {
            transform: scale(1.1);
        }

        @media (max-width: 768px) {
			.services-grid {
				grid-template-columns: 1fr; /* Одна колонка на узких экранах */
			}
            .economy-controls {
                flex-direction: column;
                align-items: flex-start;
            }

            .filter-buttons,
            .sort-buttons {
                width: 100%;
                justify-content: space-between;
            }

            .economy-resources {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            }

            .resource-card {
                padding: 10px;
            }

            .resource-icon {
                font-size: 20px;
            }

            .resource-info h3 {
                font-size: 12px;
            }

            .resource-info p {
                font-size: 10px;
            }

            .vehicle-cards {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .economy-resources {
                grid-template-columns: 1fr;
            }

            .filter-btn,
            .sort-btn {
                font-size: 10px;
                padding: 6px 10px;
            }

            .vehicle-card-details {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .shop-tabs,
            .profile-tabs {
                gap: 8px;
            }

            .shop-tab-btn,
            .profile-tab-btn {
                padding: 8px 16px;
                font-size: 12px;
            }

            .shop-content,
            .profile-content {
                padding: 16px;
            }

            .shop-empty-message {
                font-size: 14px;
            }

            .shop-empty-message i {
                font-size: 40px;
            }

            .sidebar {
                display: none;
            }

            .content {
                margin-left: 0;
                width: 100%;
            }

            .nav-bar {
                padding: 12px 16px;
            }

            .content {
                padding: 16px;
            }

            .tab-content {
                padding: 20px;
            }

            .profile-left {
                max-width: 100%;
            }

            .profile-right {
                max-width: 100%;
            }

            .chart-container {
                width: 220px;
                height: 220px;
            }
        }

        @media (max-width: 480px) {
            .nav-bar {
                flex-direction: column;
                gap: 10px;
            }

            .nav-bar .logo {
                flex-direction: column;
                gap: 5px;
            }

            .nav-bar .logo .logo-text {
                font-size: 16px;
            }

            .user-profile {
                width: 100%;
                justify-content: center;
            }

            .dropdown {
                width: 100%;
                right: 0;
            }

            .dropdown .logout-btn {
                text-align: center;
                justify-content: center;
            }

            .content {
                padding: 12px;
            }

            .chart-container {
                width: 180px;
                height: 180px;
            }
        }
    </style>
</head>
<body>
    <div class="nav-bar">
        <a href="#main" class="logo">
            <img src="logo.png" alt="RocketLife Logo">
            <span class="logo-text">RocketLife - RPG</span>
        </a>
        <div class="user-profile">
            <img src="<?php echo escape($steamProfile['avatar']); ?>" alt="Steam Avatar" loading="lazy">
            <span class="nickname"><?php echo $playerData['full_name']; ?></span>
            <div class="dropdown">
                <a href="logout.php" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Выйти</a>
            </div>
        </div>
    </div>

    <div class="sidebar">
        <div class="sidebar-profile">
            <img src="<?php echo escape($steamProfile['avatar']); ?>" alt="Steam Avatar" loading="lazy">
            <span class="nickname"><?php echo $playerData['nick_name']; ?></span>
            <span class="status <?php echo $playerData['connected'] == 'На острове' ? 'online' : 'offline'; ?>">
                <?php echo $playerData['connected'] == 'На острове' ? 'В сети' : 'Не в сети'; ?>
            </span>
        </div>
        <div class="menu-header">
            <span class="menu-label">Меню</span>
        </div>
        <ul>
            <li><a href="#profile" class="sidebar-link"><i class="fas fa-user"></i> Профиль</a></li>
            <li><a href="#shop" class="sidebar-link"><i class="fas fa-shopping-cart"></i> Магазин</a></li>
            <?php if ($isAdmin) { ?>
                <li><a href="#admin" class="sidebar-link"><i class="fas fa-cogs"></i> Админ-панель</a></li>
            <?php } ?>
        </ul>
    </div>

    <div class="content">
        <div id="main" class="tab-content active">
            <h2>Главная</h2>
            <div class="grid">
                <div class="grid-item">
                    <i class="fas fa-users"></i>
                    <div class="stat-text">
                        <span><?php echo $stats['total_players']; ?></span>
                        <div class="label">Всего игроков</div>
                    </div>
                </div>
                <div class="grid-item">
                    <i class="fas fa-car"></i>
                    <div class="stat-text">
                        <span><?php echo $stats['total_vehicles']; ?></span>
                        <div class="label">Всего машин</div>
                    </div>
                </div>
                <div class="grid-item">
                    <i class="fas fa-home"></i>
                    <div class="stat-text">
                        <span><?php echo $stats['total_houses']; ?></span>
                        <div class="label">Всего домов</div>
                    </div>
                </div>
                <div class="grid-item">
                    <i class="fas fa-wallet"></i>
                    <div class="stat-text">
                        <span><?php echo $economicStats['richest_wealth']; ?></span>
                        <div class="label">Самый богатый</div>
                    </div>
                </div>
                <div class="grid-item">
                    <i class="fas fa-exclamation-circle"></i>
                    <div class="stat-text">
                        <span><?php echo $economicStats['poverty_line']; ?></span>
                        <div class="label">Порог бедности</div>
                    </div>
                </div>
                <div class="grid-item">
                    <i class="fas fa-money-bill-wave"></i>
                    <div class="stat-text">
                        <span><?php echo $economicStats['average_income']; ?></span>
                        <div class="label">Средний доход</div>
                    </div>
                </div>
            </div>

            <div class="economy-main-section">
                <h2>Экономика</h2>
                <div class="economy-controls">
                    <div class="filter-buttons">
                        <button class="filter-btn active" data-filter="all">Все</button>
                        <button class="filter-btn" data-filter="legal">Легальные</button>
                        <button class="filter-btn" data-filter="illegal">Нелегальные</button>
                    </div>
                    <div class="sort-buttons">
                        <button class="sort-btn" data-sort="name-asc"><i class="fas fa-sort-alpha-down"></i> По имени (А-Я)</button>
                        <button class="sort-btn" data-sort="name-desc"><i class="fas fa-sort-alpha-down-alt"></i> По имени (Я-А)</button>
                        <button class="sort-btn" data-sort="price-asc"><i class="fas fa-sort-amount-down-alt"></i> По цене (возр.)</button>
                        <button class="sort-btn" data-sort="price-desc"><i class="fas fa-sort-amount-down"></i> По цене (убыв.)</button>
                    </div>
                </div>
                <div class="economy-resources">
                    <?php foreach ($economyResources as $resource) { ?>
                        <div class="resource-card <?php echo $resource['legal'] ? 'legal' : 'illegal'; ?>" 
                             data-name="<?php echo escape($resource['localize']); ?>" 
                             data-price="<?php echo $resource['sellprice']; ?>">
                            <div class="resource-icon">
                                <i class="fas <?php echo getResourceIcon($resource['localize'], $resource['legal']); ?>"></i>
                            </div>
                            <div class="resource-info">
                                <h3><?php echo escape($resource['localize']); ?></h3>
                                <p>Цена: <span><?php echo number_format($resource['sellprice']); ?> $</span></p>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>

        <div id="profile" class="tab-content">
            <h2>Профиль</h2>
            <div class="profile-tabs">
                <button class="profile-tab-btn active" data-tab="profile-info">Профиль</button>
                <button class="profile-tab-btn" data-tab="garage-info">Гараж</button>
				<button class="profile-tab-btn" data-tab="services-info">Услуги</button>
            </div>

            <div class="profile-content">
                <div id="profile-info" class="profile-tab-content active">
                    <div class="profile-container">
                        <div class="profile-left">
                            <div class="profile-block">
                                <h3>О персонаже</h3>
                                <div class="avatar-container">
                                    <img src="<?php echo escape($steamProfile['avatar']); ?>" alt="Steam Avatar" loading="lazy">
                                    <a href="<?php echo escape($steamProfile['profile_url']); ?>" class="steam-nickname" target="_blank">
                                        <?php echo $playerData['nick_name']; ?>
                                    </a>
                                    <span class="steam-id"><?php echo escape($playerid); ?></span>
                                </div>
                                <ul>
                                    <li>Имя: <span><?php echo $playerData['full_name']; ?></span></li>
                                    <li>
                                        Ваш слот: 
                                        <span class="slot-indicator" style="background-color: <?php echo $playerData['slot_color']; ?>;">
                                            <span class="tooltip"><?php echo $playerData['slot_name']; ?></span>
                                        </span>
                                    </li>
                                    <li>На острове? <span><?php echo $playerData['connected']; ?></span></li>
                                    <li>Вы отыграли на сервере: <span><?php echo $playerData['total_time']; ?></span></li>
                                    <li>Последний раз играли: <span><?php echo $playerData['last_connected']; ?></span></li>
                                    <li>Вы с нами с: <span><?php echo $playerData['insert_time']; ?></span></li>
									<li>Ключ: <span><?php echo $playerData['secret_key']; ?></span></li>
								</ul>
                            </div>

                            <div class="character-status">
                                <h3>Состояние персонажа</h3>
                                <div class="status-bar">
                                    <label>Голод</label>
                                    <div class="progress-bar">
                                        <div class="progress hunger" style="width: <?php echo $playerData['hunger']; ?>%;">
                                            <span class="progress-text"><?php echo $playerData['hunger']; ?>%</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="status-bar">
                                    <label>Жажда</label>
                                    <div class="progress-bar">
                                        <div class="progress thirst" style="width: <?php echo $playerData['thirst']; ?>%;">
                                            <span class="progress-text"><?php echo $playerData['thirst']; ?>%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="profile-right">
                            <div class="resources-block">
                                <h3>Ресурсы</h3>
                                <ul>
                                    <li>Наличность: <span><?php echo $playerData['cash']; ?></span></li>
                                    <li>Банк: <span><?php echo $playerData['bankacc']; ?></span></li>
                                    <li>Нелегальные деньги: <span><?php echo $playerData['dcash']; ?></span></li>
                                    <li>RCredits: <span><?php echo $playerData['epoint']; ?></span></li>
                                    <li>TRX: <span><?php echo $playerData['trx']; ?></span></li>
                                </ul>
                                <div class="resources-chart">
                                    <div class="chart-container">
                                        <canvas id="resourcesChart"></canvas>
                                    </div>
                                    <div class="chart-legend">
                                        <div class="legend-item cash"><span></span> Наличность (<?php echo round($cashPercent, 1); ?>%)</div>
                                        <div class="legend-item bank"><span></span> Банк (<?php echo round($bankPercent, 1); ?>%)</div>
                                        <div class="legend-item dcash"><span></span> Нелегальные деньги (<?php echo round($dcashPercent, 1); ?>%)</div>
                                        <div class="legend-item epoint"><span></span> RCredits (<?php echo round($epointPercent, 1); ?>%)</div>
                                        <div class="legend-item trx"><span></span> TRX (<?php echo round($trxPercent, 1); ?>%)</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="garage-info" class="profile-tab-content">
					<div class="grid">
						<div class="grid-item">
							<i class="fas fa-car"></i>
							<div class="stat-text">
								<span><?php echo $totalVehicles; ?></span>
								<div class="label">Всего техники</div>
							</div>
						</div>
					</div>
					<?php if (empty($vehicles)) { ?>
						<div class="grid-item">У вас нет техники в гараже.</div>
					<?php } else { ?>
						<div class="vehicle-cards">
							<?php foreach ($vehicles as $vehicle) { ?>
								<div class="vehicle-card">
									<div class="vehicle-card-header">
										<div class="vehicle-card-title">
											<?php echo escape($vehicle['displayName'] ?? $vehicle['classname']); ?>
										</div>
										<div class="vehicle-card-status <?php echo $vehicle['active'] ? 'status-active' : 'status-inactive'; ?>">
											<?php echo $vehicle['active'] ? 'Активна' : 'В гараже'; ?>
										</div>
									</div>
									<div class="vehicle-card-details">
										<div class="vehicle-card-detail">
											<span class="detail-label">Тип</span>
											<span class="detail-value"><?php echo escape($vehicle['type']); ?></span>
										</div>
										<div class="vehicle-card-detail">
											<span class="detail-label">Номерной знак</span>
											<span class="detail-value"><?php echo escape($vehicle['plate']); ?></span>
										</div>
										<div class="vehicle-card-detail">
											<span class="detail-label">Материал</span>
											<span class="detail-value"><?php echo escape($vehicle['material'] === 'default' ? 'Стандартный' : $vehicle['material']); ?></span>
										</div>
										<div class="vehicle-card-detail">
											<span class="detail-label">Топливо</span>
											<span class="detail-value"><?php echo round($vehicle['fuel'] * 100) . '%'; ?></span>
										</div>
										<div class="vehicle-card-detail">
											<span class="detail-label">Состояние</span>
											<span class="detail-value"><?php echo round((1 - $vehicle['damage']) * 100) . '%'; ?></span>
										</div>
										<div class="vehicle-card-detail">
											<span class="detail-label">Инвентарь</span>
											<span class="detail-value"><?php echo escape(formatInventory($vehicle['inventory'], $economyResources)); ?></span>
										</div>
										<!-- Добавляем информацию об удалении -->
										<div class="vehicle-card-detail">
											<span class="detail-label">Статус удаления</span>
											<span class="detail-value">
												<?php 
												if ($vehicle['deleted_at'] !== null) {
													echo 'Удалена: ' . formatDate($vehicle['deleted_at']);
												} else {
													echo 'Не удалена';
												}
												?>
											</span>
										</div>
									</div>
									<div class="vehicle-card-footer">
										<div class="vehicle-card-price">
											<?php echo number_format($vehicle['baseprice']) . ' $'; ?>
										</div>
										<div class="vehicle-card-insurance <?php echo $vehicle['insure'] ? 'insured-yes' : 'insured-no'; ?>">
											<?php echo $vehicle['insure'] ? 'Страховка: Да' : 'Страховка: Нет'; ?>
										</div>
									</div>
								</div>
							<?php } ?>
						</div>
					<?php } ?>
				</div>
				<div id="services-info" class="profile-tab-content">
					<h2>Услуги</h2>
					<div class="services-container">
						<h3>Покупка VIP-статуса</h3>
						<div class="vip-cards">
							<?php 
							$vipPrices = [3300, 6600, 9900, 13200, 16500];
							for ($level = 1; $level <= 5; $level++) { 
								$price = $vipPrices[$level - 1];
								$days = 30;
							?>
								<div class="vip-card">
									<div class="vip-card-header">
										<div class="vip-card-title">VIP Уровень <?php echo $level; ?></div>
										<div class="vip-card-status <?php echo $level == $player['donorlevel'] ? 'status-active' : 'status-inactive'; ?>">
											<?php echo $level == $player['donorlevel'] ? 'Активен' : 'Доступен'; ?>
										</div>
									</div>
									<div class="vip-card-details">
										<div class="vip-card-detail">
											<span class="detail-label">Стоимость</span>
											<span class="detail-value"><?php echo number_format($price); ?> EPoint</span>
										</div>
										<div class="vip-card-detail">
											<span class="detail-label">Срок</span>
											<span class="detail-value">Скоро</span>
										</div>
										<div class="vip-card-detail">
											<span class="detail-label">Бонус к опыту</span>
											<span class="detail-value">Скоро</span>
										</div>
										<div class="vip-card-detail">
											<span class="detail-label">Слоты в гараже</span>
											<span class="detail-value">Скоро</span>
										</div>
										<div class="vip-card-detail">
											<span class="detail-label">Скидка в магазине</span>
											<span class="detail-value">Скоро</span>
										</div>
									</div>
									<div class="vip-card-footer">
										<?php if ($level == $player['donorlevel'] && $player['donat_time'] > date('Y-m-d H:i:s')) { ?>
											<span class="vip-card-expiry">Истекает: <?php echo formatDate($player['donat_time']); ?></span>
										<?php } elseif ($playerData['epoint_raw'] >= $price) { ?>
											<form method="POST" action="buy_vip.php" class="vip-button-form">
												<input type="hidden" name="level" value="<?php echo $level; ?>">
												<button type="submit" class="vip-card-btn">Купить</button>
											</form>
										<?php } else { ?>
											<span class="vip-card-insufficient">Недостаточно EPoint</span>
										<?php } ?>
									</div>
								</div>
							<?php } ?>
						</div>
						
						<h3>Дополнительные услуги</h3>
						<div class="services-grid">
							<div class="name-change-card">
								<div class="name-change-header">
									<h4>Конвертировать EPoint</h4>
									<span class="name-change-icon"><i class="fas fa-exchange-alt"></i></span>
								</div>
								<div class="name-change-body">
									<p>Текущий баланс EPoint: <span><?php echo number_format($playerData['epoint_raw']); ?></span></p>
									<p>Текущий баланс банка: <span><?php echo number_format($playerData['bankacc_raw']); ?> $</span></p>
									<p>Курс: <span>1 EPoint = 106.06 $</span></p>
									<form method="POST" action="convert_epoint.php">
										<div class="name-input">
											<input type="number" name="epoint_to_convert" placeholder="Количество EPoint" min="1" step="1" required>
										</div>
										<?php if ($playerData['epoint_raw'] >= 1) { ?>
											<button type="submit" class="name-change-btn">Конвертировать</button>
										<?php } else { ?>
											<span class="name-insufficient">Недостаточно EPoint (мин. 1)</span>
										<?php } ?>
									</form>
								</div>
							</div>

							<div class="name-change-card">
								<div class="name-change-header">
									<h4>Изменить данные</h4>
									<span class="name-change-icon"><i class="fas fa-user-edit"></i></span>
								</div>
								<div class="name-change-body">
									<p>Текущее имя: <span><?php echo escape($playerData['first_name']); ?></span></p>
									<p>Текущая фамилия: <span><?php echo escape($playerData['last_name']); ?></span></p>
									<p>Текущий ник: <span><?php echo escape($playerData['nick_name']); ?></span></p>
									<form method="POST" action="change_name.php">
										<div class="name-input">
											<input type="text" name="new_first_name" placeholder="Новое имя" maxlength="64" required>
										</div>
										<div class="name-input">
											<input type="text" name="new_last_name" placeholder="Новая фамилия" maxlength="64" required>
										</div>
										<div class="name-input">
											<input type="text" name="new_nick_name" placeholder="Новый ник" maxlength="64" required>
										</div>
										<p>Стоимость: <span>3,300 EPoint</span></p>
										<?php if ($playerData['epoint_raw'] >= 3300) { ?>
											<button type="submit" class="name-change-btn">Сменить данные</button>
										<?php } else { ?>
											<span class="name-insufficient">Недостаточно EPoint</span>
										<?php } ?>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
        </div>

        <div id="shop" class="tab-content">
            <h2>Магазин</h2>
            <div class="shop-tabs">
                <button class="shop-tab-btn active" data-tab="transport">Транспорт</button>
                <button class="shop-tab-btn" data-tab="cases">Кейсы</button>
                <button class="shop-tab-btn" data-tab="kits">Наборы</button>
                <button class="shop-tab-btn" data-tab="weapons">Оружие</button>
                <button class="shop-tab-btn" data-tab="gear">Снаряжение</button>
            </div>

            <div class="shop-content">
                <div id="transport" class="shop-tab-content active">
                    <div class="shop-empty-message">
                        <i class="fas fa-car"></i>
                        <p>В данной вкладке пока что нету товаров</p>
                    </div>
                </div>
                <div id="cases" class="shop-tab-content">
                    <div class="shop-empty-message">
                        <i class="fas fa-box-open"></i>
                        <p>В данной вкладке пока что нету товаров</p>
                    </div>
                </div>
                <div id="kits" class="shop-tab-content">
                    <div class="shop-empty-message">
                        <i class="fas fa-gift"></i>
                        <p>В данной вкладке пока что нету товаров</p>
                    </div>
                </div>
                <div id="weapons" class="shop-tab-content">
                    <div class="shop-empty-message">
                        <i class="fas fa-gun"></i>
                        <p>В данной вкладке пока что нету товаров</p>
                    </div>
                </div>
                <div id="gear" class="shop-tab-content">
                    <div class="shop-empty-message">
                        <i class="fas fa-shield-alt"></i>
                        <p>В данной вкладке пока что нету товаров</p>
                    </div>
                </div>
            </div>
        </div>

        <?php if ($isAdmin) { ?>
            <div id="admin" class="tab-content">
                <h2>Админ-панель</h2>
                <?php if ($adminMessage) { ?>
                    <div class="admin-message">
                        <i class="fas fa-check-circle"></i> <?php echo $adminMessage; ?>
                    </div>
                <?php } ?>

                <div class="admin-form">
                    <h3>Управление техработами</h3>
                    <form method="POST">
                        <button type="submit" name="toggle_maintenance">
                            <?php echo $maintenanceMode ? 'Отключить техработы' : 'Включить техработы'; ?>
                        </button>
                    </form>
                </div>
            </div>
        <?php } ?>
    </div>

	<script>
		document.addEventListener('DOMContentLoaded', () => {
        // Обработка кликов по боковому меню и логотипу
        document.addEventListener('click', (e) => {
            const sidebarLink = e.target.closest('.sidebar-link');
            const userProfile = e.target.closest('.user-profile');
            const dropdown = document.querySelector('.dropdown');
            const avatar = e.target.closest('.sidebar-profile img');
            const logo = e.target.closest('.logo'); // Добавляем проверку на логотип

            if (sidebarLink) {
                e.preventDefault();
                document.querySelectorAll('.sidebar-link').forEach(l => l.classList.remove('active'));
                document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
                sidebarLink.classList.add('active');
                const href = sidebarLink.getAttribute('href').substring(1);
                const targetTab = document.getElementById(href);
                if (targetTab) {
                    targetTab.classList.add('active');
                }
            }

            if (userProfile) {
                userProfile.classList.toggle('active');
                dropdown.classList.toggle('active');
            } else if (!dropdown.contains(e.target)) {
                userProfile?.classList.remove('active');
                dropdown.classList.remove('active');
            }

            // Переход в профиль при клике на аватар
            if (avatar) {
                e.preventDefault();
                document.querySelectorAll('.sidebar-link').forEach(l => l.classList.remove('active'));
                document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
                const profileLink = document.querySelector('.sidebar-link[href="#profile"]');
                profileLink.classList.add('active');
                document.getElementById('profile').classList.add('active');
            }

            // Переход на главную при клике на логотип
            if (logo) {
                e.preventDefault();
                document.querySelectorAll('.sidebar-link').forEach(l => l.classList.remove('active'));
                document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
                document.getElementById('main').classList.add('active');
            }
        });

        // Обработка вкладок магазина
        document.querySelectorAll('.shop-tab-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                document.querySelectorAll('.shop-tab-btn').forEach(b => b.classList.remove('active'));
                document.querySelectorAll('.shop-tab-content').forEach(c => c.classList.remove('active'));
                btn.classList.add('active');
                const tabId = btn.getAttribute('data-tab');
                document.getElementById(tabId).classList.add('active');
            });
        });

        // Обработка вкладок профиля
		document.querySelectorAll('.profile-tab-btn').forEach(btn => {
			btn.addEventListener('click', () => {
				document.querySelectorAll('.profile-tab-btn').forEach(b => b.classList.remove('active'));
				document.querySelectorAll('.profile-tab-content').forEach(c => c.classList.remove('active'));
				btn.classList.add('active');
				const tabId = btn.getAttribute('data-tab');
				document.getElementById(tabId).classList.add('active');
			});
		});

        // Фильтрация ресурсов
        const filterButtons = document.querySelectorAll('.filter-btn');
        const sortButtons = document.querySelectorAll('.sort-btn');
        const resourceCards = Array.from(document.querySelectorAll('.resource-card'));

        filterButtons.forEach(btn => {
            btn.addEventListener('click', () => {
                filterButtons.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                const filter = btn.getAttribute('data-filter');
                resourceCards.forEach(card => {
                    if (filter === 'all') {
                        card.style.display = 'flex';
                    } else if (filter === 'legal' && card.classList.contains('legal')) {
                        card.style.display = 'flex';
                    } else if (filter === 'illegal' && card.classList.contains('illegal')) {
                        card.style.display = 'flex';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        });

        // Сортировка ресурсов
        sortButtons.forEach(btn => {
            btn.addEventListener('click', () => {
                const sortType = btn.getAttribute('data-sort');
                let sortedCards = [...resourceCards];

                if (sortType === 'name-asc') {
                    sortedCards.sort((a, b) => a.dataset.name.localeCompare(b.dataset.name));
                } else if (sortType === 'name-desc') {
                    sortedCards.sort((a, b) => b.dataset.name.localeCompare(a.dataset.name));
                } else if (sortType === 'price-asc') {
                    sortedCards.sort((a, b) => parseFloat(a.dataset.price) - parseFloat(b.dataset.price));
                } else if (sortType === 'price-desc') {
                    sortedCards.sort((a, b) => parseFloat(b.dataset.price) - parseFloat(a.dataset.price));
                }

                const container = document.querySelector('.economy-resources');
                sortedCards.forEach(card => container.appendChild(card));
            });
        });

        // График ресурсов с исправленными цветами
        const ctx = document.getElementById('resourcesChart').getContext('2d');
        const resourcesChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Наличность', 'Банк', 'Нелегальные деньги', 'RCredits', 'TRX'],
                datasets: [{
                    data: [
                        <?php echo $playerData['cash_raw']; ?>,
                        <?php echo $playerData['bankacc_raw']; ?>,
                        <?php echo $playerData['dcash_raw']; ?>,
                        <?php echo $playerData['epoint_raw']; ?>,
                        <?php echo $playerData['trx_raw']; ?>
                    ],
                    backgroundColor: [
                        '#4ade80', // --cash-color
                        '#60a5fa', // --bank-color
                        '#a78bfa', // --dcash-color
                        '#f4a261', // --epoint-color
                        '#ff6b6b'  // --trx-color
                    ],
                    borderWidth: 2,
                    borderColor: '#fff',
                    hoverOffset: 10
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '70%',
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                        titleFont: { size: 14, weight: 'bold' },
                        bodyFont: { size: 12 },
                        padding: 10,
                        cornerRadius: 6,
                        callbacks: {
                            label: function(tooltipItem) {
                                const label = tooltipItem.label || '';
                                const value = tooltipItem.raw || 0;
                                return `${label}: ${value.toLocaleString()} (${Math.round((value / <?php echo $totalResources; ?>) * 100)}%)`;
                            }
                        }
                    }
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        });

        // Показ уведомлений
        const urlParams = new URLSearchParams(window.location.search);
        const status = urlParams.get('status');
        if (status) {
            const notification = document.createElement('div');
            notification.className = `notification ${status === 'success' ? 'success' : status === 'error' ? 'error' : 'info'} visible`;
            notification.innerHTML = `<i class="fas fa-${status === 'success' ? 'check-circle' : status === 'error' ? 'exclamation-circle' : 'info-circle'}"></i> ${urlParams.get('message') || 'Сообщение'}`;
            document.body.appendChild(notification);
            setTimeout(() => {
                notification.classList.remove('visible');
                setTimeout(() => notification.remove(), 300);
            }, 3000);
        }
    });
</script>