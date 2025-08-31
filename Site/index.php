<!-- index.php -->
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RocketLife - RPG</title>
	<link rel="icon" type="image/png" href="logo.png">
    <link rel="apple-touch-icon" href="logo.png">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #8f7fd5;
            --primary-hover: #7b6bb3;
            --background-light: #f8f9fd;
            --background-dark: #edebf5;
            --text-primary: #2d2d2d;
            --text-secondary: #6b7280;
            --card-bg: rgba(255, 255, 255, 0.95);
            --shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        html {
            height: 100%;
            overflow-y: hidden;
            scroll-snap-type: y mandatory;
            scroll-behavior: smooth;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(145deg, var(--background-light) 0%, var(--background-dark) 100%);
            color: var(--text-primary);
            overflow: hidden;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(145deg, rgba(248, 249, 253, 0.8), rgba(237, 235, 245, 0.8));
            z-index: -1;
            transform: translateY(0);
            transition: transform 0.5s ease;
        }

        .section {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            scroll-snap-align: start;
            position: relative;
            z-index: 1;
        }

        .logo {
            position: absolute;
            top: 16px;
            left: 24px;
            z-index: 10;
        }

        .logo a img {
            height: 40px;
            transition: filter 0.3s ease, transform 0.3s ease;
        }

        .logo a:hover img {
            transform: scale(1.05);
            filter: brightness(1.2);
        }

        .nav {
            position: absolute;
            top: 20px;
            right: 60px;
            display: flex;
            gap: 24px;
            z-index: 10;
        }

        .nav a {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            position: relative;
            transition: color 0.3s ease;
        }

        .nav a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 1px;
            bottom: -4px;
            left: 0;
            background: var(--primary-hover);
            transition: width 0.3s ease;
        }

        .nav a:hover::after {
            width: 100%;
        }

        .nav a:hover {
            color: var(--primary-hover);
        }

        .content {
            text-align: center;
            max-width: 600px;
            padding: 20px;
            animation: fadeIn 1s ease forwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .content h1 {
            font-size: 36px;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 16px;
        }

        .content p {
            font-size: 16px;
            color: var(--text-secondary);
            margin-bottom: 24px;
            line-height: 1.5;
        }

        .content a {
            display: inline-block;
            background: var(--primary-color);
            color: #fff;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: background 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            animation: pulse 2s infinite ease-in-out;
        }

        .content a:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .steps-container {
            display: flex;
            justify-content: center;
            gap: 16px;
            flex-wrap: wrap;
            padding: 20px;
            max-width: 1400px; /* Увеличил ширину контейнера */
            margin: 0 auto;
        }

        .step {
            background: var(--card-bg);
            border-radius: 10px;
            padding: 20px;
            width: 19%; /* Чуть шире для 5 шагов */
            min-width: 200px;
            text-align: center;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .step:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.1);
        }

        .step h2 {
            font-size: 18px;
            font-weight: 500;
            color: var(--primary-color);
            margin-bottom: 12px;
        }

        .step p {
            font-size: 14px;
            color: var(--text-secondary);
            margin-bottom: 12px;
            flex-grow: 1;
        }

        .step a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .step a:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }

        .scrollbar-buttons {
            position: fixed;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            display: flex;
            flex-direction: column;
            gap: 16px;
            z-index: 10;
        }

        .scrollbar-button {
            width: 24px;
            height: 24px;
            background: var(--primary-color);
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.3s ease, transform 0.3s ease, opacity 0.3s ease;
            opacity: 0.7;
        }

        .scrollbar-button.active {
            background: var(--primary-hover);
            opacity: 1;
            transform: scale(1.1);
        }

        .scrollbar-button:hover {
            transform: scale(1.1);
            opacity: 0.9;
        }

        .scrollbar-button::before {
            content: '';
            display: block;
            width: 8px;
            height: 8px;
            border: solid var(--background-light);
            border-width: 0 2px 2px 0;
        }

        #scroll-up::before {
            transform: rotate(-135deg);
        }

        #scroll-down::before {
            transform: rotate(45deg);
        }

        @media (max-width: 1200px) {
            .step {
                width: 30%; /* 3 в ряд */
            }
        }

        @media (max-width: 768px) {
            .step {
                width: 45%; /* 2 в ряд */
            }

            .nav {
                flex-direction: column;
                gap: 12px;
                right: 40px;
            }
        }

        @media (max-width: 480px) {
            .step {
                width: 100%; /* 1 в столбец */
            }

            .content h1 {
                font-size: 28px;
            }

            .content p {
                font-size: 14px;
            }

            .nav {
                top: 60px;
                right: 16px;
            }

            .scrollbar-buttons {
                right: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Логотип -->
    <div class="logo">
        <a href="/">
            <img src="logo.png" alt="RocketLife - RPG">
        </a>
    </div>

    <!-- Навигация -->
    <div class="nav">
        <a href="https://forum.rimas-rp.ru" target="_blank">Форум</a>
        <a href="http://lk.rocketrp.ru" target="_blank">Личный кабинет</a>
    </div>

    <!-- Кнопки прокрутки -->
    <div class="scrollbar-buttons">
        <div class="scrollbar-button" id="scroll-up"></div>
        <div class="scrollbar-button" id="scroll-down"></div>
    </div>

    <!-- Секция с информацией о проекте -->
    <section class="section">
        <div class="content">
            <h1>RocketLife - RPG</h1>
            <p>RocketLife - RPG — это уникальный сервер для Arma 3, где тебя ждут захватывающие ролевые приключения, реалистичный геймплей и дружное сообщество. Присоединяйся к нам и стань частью эпичных историй!</p>
            <a href="#steps">Узнать, как подключиться</a>
        </div>
    </section>

    <!-- Секция с 5 шагами -->
    <section class="section" id="steps">
        <div class="steps-container">
            <div class="step">
                <h2>Шаг 1</h2>
                <p>Купите и установите Arma 3.</p>
                <a href="https://store.steampowered.com/app/107410/Arma_3/" target="_blank">Steam</a>
            </div>
            <div class="step">
                <h2>Шаг 2</h2>
                <p>Установите наш мод из Steam Workshop.</p>
                <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=3113890535" target="_blank">Workshop</a>
            </div>
            <div class="step">
                <h2>Шаг 3</h2>
                <p>Установите TeamSpeak и Task Force Radio.</p>
                <p style="font-size: 12px;">(Не обновляйте TeamSpeak после запуска)</p>
                <a href="https://drive.google.com/file/d/1NWSeYg2hdrgX-kUSp3MA7e0WyTm7RI2Z/view?usp=sharing" target="_blank">TeamSpeak</a>
            </div>
            <div class="step">
                <h2>Шаг 4</h2>
                <p>Подключитесь к TeamSpeak серверу.</p>
                <a href="#" onclick="navigator.clipboard.writeText('rimas-ts.ru'); alert('Адрес скопирован: rimas-ts.ru');">rimas-ts.ru</a>
            </div>
            <div class="step">
                <h2>Шаг 5</h2>
                <p>Запустите игру и подключитесь к серверу.</p>
                <a href="#" onclick="navigator.clipboard.writeText('s1.rimas-rp.ru'); alert('Адрес скопирован: s1.rimas-rp.ru');">s1.rimas-rp.ru</a>
            </div>
        </div>
    </section>

    <!-- JavaScript -->
    <script>
        const scrollUp = document.getElementById('scroll-up');
        const scrollDown = document.getElementById('scroll-down');

        // Обновление состояния кнопок
        function updateScrollButtons() {
            const scrollPosition = window.scrollY;
            const maxScroll = window.innerHeight;

            if (scrollPosition === 0) {
                scrollUp.classList.add('active');
                scrollDown.classList.remove('active');
            } else if (scrollPosition >= maxScroll) {
                scrollUp.classList.remove('active');
                scrollDown.classList.add('active');
            }
        }

        // Прокрутка вверх
        scrollUp.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });

        // Прокрутка вниз
        scrollDown.addEventListener('click', () => {
            window.scrollTo({
                top: window.innerHeight,
                behavior: 'smooth'
            });
        });

        // Прокрутка колёсиком
        let isScrolling = false;
        window.addEventListener('wheel', (e) => {
            if (isScrolling) return;
            isScrolling = true;

            const direction = e.deltaY > 0 ? 1 : -1;
            const currentSection = Math.round(window.scrollY / window.innerHeight);
            const nextSection = currentSection + direction;

            if (nextSection >= 0 && nextSection < 2) {
                window.scrollTo({
                    top: nextSection * window.innerHeight,
                    behavior: 'smooth'
                });
            }

            setTimeout(() => { isScrolling = false; }, 800);
        });

        // Параллакс фона
        window.addEventListener('scroll', () => {
            const scrollY = window.scrollY;
            document.body.style.backgroundPositionY = `calc(50% + ${scrollY / 20}px)`;
        });

        // Обновление кнопок
        window.addEventListener('scroll', updateScrollButtons);
        window.addEventListener('load', updateScrollButtons);
    </script>
</body>
</html>