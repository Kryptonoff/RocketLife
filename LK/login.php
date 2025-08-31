<?php
session_start();
require_once 'config.php';
require_once 'openid.php';

// Определяем протокол (HTTP или HTTPS)
$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? "https://" : "http://";
$openid = new LightOpenID($protocol . $_SERVER['HTTP_HOST']);

// Проверяем, авторизован ли пользователь
if (isset($_SESSION['playerid'])) {
    // Проверка adminlevel игрока
    $playerid = $_SESSION['playerid'];
    $stmt = $conn->prepare("SELECT adminlevel, name FROM players WHERE playerid = :playerid");
    $stmt->execute(['playerid' => $playerid]);
    $player = $stmt->fetch(PDO::FETCH_ASSOC);
    $isAdmin = $player['adminlevel'] == '5';

    // Проверка режима техработ
    $maintenanceFile = 'maintenance.txt';
    $maintenanceMode = file_exists($maintenanceFile);

    if ($maintenanceMode && !$isAdmin) {
        ?>
        <!DOCTYPE html>
        <html lang="ru">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Личный кабинет - Технические работы</title>
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

    header("Location: index.php");
    exit();
}

// Устанавливаем identity для Steam
$openid->identity = 'https://steamcommunity.com/openid';

// Обрабатываем ответ от Steam (если пользователь вернулся после авторизации)
if ($openid->mode) {
    if ($openid->mode == 'cancel') {
        $_SESSION['error'] = 'Пользователь отменил авторизацию.';
    } else {
        if ($openid->validate()) {
            $id = $openid->identity;
            error_log("Steam OpenID response: " . print_r($id, true));

            // Обновленное регулярное выражение для SteamID64 (17 цифр)
            $ptn = "/^https?:\/\/steamcommunity\.com\/openid\/id\/(7656[0-1][0-9]{12})$/";
            preg_match($ptn, $id, $matches);

            if (!empty($matches[1])) {
                $steamid = $matches[1];
                $stmt = $conn->prepare("SELECT playerid, adminlevel, name, secret_key FROM players WHERE playerid = :playerid");
                $stmt->execute(['playerid' => $steamid]);
                $player = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($player) {
                    $_SESSION['playerid'] = $steamid;
                    $isAdmin = $player['adminlevel'] == '5';

                    // Проверка и создание секретного ключа
                    if (empty($player['secret_key'])) {
                        $secret_key = bin2hex(random_bytes(16)); // Генерация 32-символьного ключа
                        $stmt = $conn->prepare("UPDATE players SET secret_key = :secret_key WHERE playerid = :playerid");
                        $stmt->execute([
                            'secret_key' => $secret_key,
                            'playerid' => $steamid
                        ]);
                    }

                    // Логирование входа в player_logins
                    $stmt = $conn->prepare("INSERT INTO player_logins (steamid, nickname, login_time) VALUES (:steamid, :nickname, NOW())");
                    $stmt->execute(['steamid' => $steamid, 'nickname' => $player['name']]);

                    // Проверка режима техработ после авторизации
                    $maintenanceFile = 'maintenance.txt';
                    $maintenanceMode = file_exists($maintenanceFile);

                    if ($maintenanceMode && !$isAdmin) {
                        ?>
                        <!DOCTYPE html>
                        <html lang="ru">
                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Личный кабинет - Технические работы</title>
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

                    header("Location: index.php");
                    exit();
                } else {
                    $_SESSION['error'] = "Игрок не найден в базе данных.";
                }
            } else {
                $_SESSION['error'] = "Неверный SteamID. Получено: " . htmlspecialchars($id);
            }
        } else {
            // Добавляем отладочную информацию
            $error = "Ошибка авторизации. ";
            $error .= "Mode: " . $openid->mode . ". ";
            $error .= "Data: " . print_r($openid->data, true) . ". ";
            $error .= "Return URL: " . $openid->returnUrl . ". ";
            $error .= "Expected Return URL: " . $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
            $_SESSION['error'] = $error;
            error_log("Steam Authentication failed: " . $error);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Авторизация</title>
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
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
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

        .login-container {
            background: var(--card-bg);
            padding: 40px;
            border-radius: 12px;
            box-shadow: var(--shadow);
            text-align: center;
            max-width: 400px;
            width: 100%;
            backdrop-filter: blur(10px);
        }

        .login-container .logo {
            margin-bottom: 20px;
        }

        .login-container .logo img {
            height: 50px;
        }

        .login-container h1 {
            font-size: 24px;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .login-container p {
            font-size: 14px;
            color: var(--text-secondary);
            margin-bottom: 20px;
        }

        .login-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: var(--primary-color);
            color: #fff;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .login-btn i {
            font-size: 18px;
        }

        .login-btn:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
        }

        .notification {
            background: #ff4d4d;
            color: #fff;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 20px;
            }

            .login-container h1 {
                font-size: 20px;
            }

            .login-container p {
                font-size: 12px;
            }

            .login-btn {
                padding: 10px 20px;
                font-size: 14px;
            }

            .login-container .logo img {
                height: 40px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <img src="logo.png" alt="RocketLife Logo">
        </div>
        <h1>Добро пожаловать!</h1>
        <p>Войдите в личный кабинет через Steam, чтобы продолжить.</p>
        <?php if (isset($_SESSION['error'])): ?>
            <div class="notification"><?php echo htmlspecialchars($_SESSION['error']); unset($_SESSION['error']); ?></div>
        <?php endif; ?>
        <a href="<?php echo $openid->authUrl(); ?>" class="login-btn">
            <i class="fab fa-steam"></i> Войти через Steam
        </a>
    </div>
</body>
</html>