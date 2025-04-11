<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Showroom Success</title>
    <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
        type="image/png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        :root {
            --main-color: #5c899d;
            --bg-color: #fffcef;
            --text-color: #2e4a56;
        }

        body {
            margin: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
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
            padding: 10px 20px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        header img {
            height: 40px;
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

        .close-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 30px;
            color: white;
            cursor: pointer;
        }

        .show-menu {
            right: 0;
        }

        .success-img img {
            width: 200px;
            height: auto;
            margin-top: 80px;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-top: 20px;
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
          <a href="bikesInformation"><i class="bi bi-bicycle"></i>Bikes Information</a>
          <a href="getDetails"><i class="bi bi-box-arrow-in-right"></i> Assign Bike to Showroom</a>
          <a href="register"><i class="bi bi-person-plus-fill"></i> Registration</a>
          <a href="followUp"><i class="bi bi-person-lines-fill"></i>Follow Up</a>
          <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
    </nav>

    <div class="success-img">
        <img src="https://i.ibb.co/W4b9Q9dS/24122187-bwink-msc-07-single-09-Photoroom.png" alt="Showroom Success Image">
    </div>

    <h2>Showroom Added Successfully!</h2>

    <script>
        function toggleMenu() {
            const menu = document.getElementById('navMenu');
            menu.classList.toggle('show-menu');
        }
    </script>

</body>

</html>