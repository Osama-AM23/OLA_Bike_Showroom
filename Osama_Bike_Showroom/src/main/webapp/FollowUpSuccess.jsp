<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Follow-Up-Success</title>
    <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
        type="image/png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        :root {
            --main-color: #5c899d;
            --bg-color: #fffcef;
            --text-color: #2e4a56;
            --table-bg: #f8f9fa;
            --table-hover: #dbe9f1;
        }

        body {
            margin: 0;
            font-family: system-ui, sans-serif;
            background: var(--bg-color);
            color: var(--text-color);
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding-top: 80px;
            animation: fadeIn 1s ease-in-out;
        }

        header {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 12px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        header img {
            height: 40px;
            width: auto;
            transition: transform 0.3s ease-in-out;
        }

        header img:hover {
            transform: scale(1.1);
        }

        .menu-icon {
            font-size: 24px;
            color: black;
            cursor: pointer;
            margin-left: auto;
            margin-right: 40px;
            position: relative;
        }

        .menu-icon:hover {
            color: var(--text-color);
        }

        .nav-menu {
            position: fixed;
            top: 0;
            right: -250px;
            width: 250px;
            height: 100%;
            background: var(--main-color);
            display: flex;
            flex-direction: column;
            padding-top: 60px;
            transition: right 0.3s ease-in-out;
            text-align: center;
        }

        .nav-menu a {
            color: var(--bg-color);
            font-size: 18px;
            text-decoration: none;
            margin: 10px 0;
            padding: 12px;
            display: block;
            transition: background 0.3s ease;
        }

        .nav-menu a:hover {
            background: #add7e9;
            color: var(--text-color);
        }

        .show-menu {
            right: 0;
        }

        @keyframes float {
            0% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-15px);
            }

            100% {
                transform: translateY(0px);
            }
        }

        @keyframes slideInRight {
            0% {
                transform: translateX(100%);
                opacity: 0;
            }

            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }

        img[alt="logo"] {
            width: 220px;
            margin-top: 40px;
            animation: float 3s ease-in-out infinite;
            transition: transform 0.3s ease;
        }

        img[alt="logo"]:hover {
            transform: scale(1.05);
        }

        h2 {
            font-size: 22px;
            margin-top: 20px;
            animation: slideInRight 1s ease forwards;
            opacity: 0;
            color: var(--main-color);
            font-weight: bold;
            letter-spacing: 1px;
        }

        .nav-menu {
            box-shadow: -4px 0px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>

<body>
    <header>
        <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg" alt="OLA Electric">
        <i class="bi bi-list menu-icon" onclick="toggleMenu()"></i>
    </header>

    <nav class="nav-menu" id="navMenu">
        <span class="close-btn" onclick="toggleMenu()">&times;</span>
        <a href="addShowRoom"><i class="bi bi-plus-circle-fill"></i> Add Showroom</a>
        <a href="addBikeDetails"><i class="bi bi-plus-circle-fill"></i> Add Bike Details</a>
        <a href="getDetails"><i class="bi bi-box-arrow-in-right"></i> Assign Bike to Showroom</a>
        <a href="register"><i class="bi bi-person-plus-fill"></i> Registration</a>
        <a href="followUp"><i class="bi bi-person-lines-fill"></i>Follow Up</a>
        <a href="bikesInformation"><i class="bi bi-bicycle"></i>Bikes Information</a>
        <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
    </nav>

    <img src="https://i.ibb.co/Jwg32RDP/8320200-3891942-Photoroom.png" alt="logo">
    <h2>Follow Up Update is Done</h2>
</body>
<script>
    function toggleMenu() {
        const menu = document.getElementById('navMenu');
        menu.classList.toggle('show-menu');
    }
</script>

</html>