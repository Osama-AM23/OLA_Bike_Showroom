<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OLA Electric</title>
    <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
        type="image/png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        :root {
            --main-color: #5c899d;
            --bg-color: #ffffff;
            --text-color: #2e4a56;
        }

        body {
            margin: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif, sans-serif;
            background: var(--bg-color);
            color: var(--text-color);
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--main-color);
            padding: 8px 15px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
        }

        header img {
            height: 25px;
            width: auto;
        }

        .menu-icon {
            font-size: 24px;
            color: white;
            cursor: pointer;
            margin-left: auto;
            margin-right: 40px;
            position: relative;
        }

        .menu-icon:hover {
            color: var(--text-color);
        }

        .menu-icon::after {
            content: "Menu";
            position: absolute;
            top: -25px;
            right: 0;
            background: var(--main-color);
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        /* Right slide-in menu */
        .menu {
            display: flex;
            flex-direction: column;
            position: fixed;
            top: 50px;
            right: -200px;
            background: var(--main-color);
            border-radius: 5px 0 0 5px;
            padding: 10px;
            box-shadow: -2px 2px 10px rgba(0, 0, 0, 0.2);
            width: 180px;
            text-align: center;
            transition: right 0.3s ease-in-out;
            z-index: 999;
        }

        .menu.open {
            right: 0;
        }

        .menu a {
            text-decoration: none;
            color: white;
            padding: 10px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }

        .scrolling-text {
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            color: var(--main-color);
            font-weight: bold;
            padding: 8px 0;
            margin-top: 0%;
        }

        .scrolling-text p {
            display: inline-block;
            padding-left: 100%;
            animation: scroll-left 15s linear infinite;
        }

        @keyframes scroll-left {
            0% {
                transform: translateX(0);
            }

            100% {
                transform: translateX(-100%);
            }
        }

        /* Left column images */
        .left-images {
            position: fixed;
            top: 100px;
            left: 0;
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding: 20px 20px;
            margin-top: 0%;
            z-index: 1;
        }

        .left-images img {
            width: 180px;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
        }

        .bottom-right-img {
            position: fixed;
            bottom: 10px;
            right: 0px;
            width: 400px;
            height: auto;
        }
    </style>
</head>

<body>
    <header>
        <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg" alt="OLA Electric">
        <i class="bi bi-list menu-icon" onclick="toggleMenu()"></i>
        <nav class="menu" id="menu">
            <a href="adminLogin">ADMIN</a>
            <a href="#">USER</a>
        </nav>
    </header>

    <div class="scrolling-text">
        <p>Welcome to the Future of Mobility with OLA Electric! Experience Innovation, Power & Style.</p>
    </div>


    <div class="left-images">
        <img src="https://i.ibb.co/hJCCCTHm/homepage-banner-s1x-web-image-130624.webp" alt="Ola S1 Pro">
        <img src="https://i.ibb.co/hJVs94J5/hp-banner-web-image-180325.webp" alt="Ola S1 Pro">
        <img src="https://i.ibb.co/67rKX4TJ/s1-x-gen3-plus-banner-web-image.webp" alt="Ola S1 Air">
        <img src="https://i.ibb.co/gshS6d2/s1pro-plus-section-web-image-v7.webp" alt="Ola S1">
    </div>

    <!-- Main content -->
    <div class="container">
        <h2>Welcome To OLA Electric</h2>
        <h4>Where Would You Like To Start?</h4>
    </div>

    <!-- Bottom right image -->
    <img class="bottom-right-img" src="https://i.ibb.co/TMf6Mkrh/home-experience-center-bg-v2-Photoroom.png"
        alt="Experience Center">

    <script>
        function toggleMenu() {
            var menu = document.getElementById('menu');
            if (menu.classList.contains('open')) {
                menu.classList.remove('open');
            } else {
                menu.classList.add('open');
            }
        }
    </script>
</body>


</html>