<%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
        type="image/png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        :root {
            --main-color: #5c899d;
            --bg-color: #fffcef;
            --text-color: #2e4a56;
            --button-hover: #4a7388;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            animation: fadeIn 1.5s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        header {
            background: var(--main-color);
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header-btn {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .menu-icon {
            font-size: 1.9rem;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .menu-icon:hover {
            transform: rotate(90deg);
        }

        .email-text {
            font-size: 1rem;
            cursor: pointer;
        }

        .nav-menu {
            position: fixed;
            top: 0;
            right: -300px;
            width: 250px;
            height: 100%;
            background-color: var(--main-color);
            color: white;
            padding: 20px;
            transition: right 0.4s ease;
            box-shadow: -4px 0 10px rgba(0, 0, 0, 0.2);
        }

        .nav-menu.show-menu {
            right: 0;
        }

        .nav-menu a {
            display: block;
            margin: 20px 0;
            color: white;
            text-decoration: none;
            font-size: 1.5rem;
            position: relative;
            padding-left: 25px;
            opacity: 0;
            animation: popupLinks 0.6s forwards;
        }

        .nav-menu a:nth-child(2) {
            animation-delay: 0.1s;
        }

        .nav-menu a:nth-child(3) {
            animation-delay: 0.2s;
        }

        .nav-menu a:nth-child(4) {
            animation-delay: 0.3s;
        }

        @keyframes popupLinks {
            to {
                opacity: 1;
                transform: translateX(0);
            }

            from {
                opacity: 0;
                transform: translateX(30px);
            }
        }

        .close-btn {
            font-size: 2rem;
            cursor: pointer;
            margin-bottom: 20px;
            display: block;
            text-align: right;
        }

        .container {
            max-width: 720px;
            margin: 25px auto;
            padding: 2px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            animation: fadeIn 1s ease;
        }

        form h3 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--text-color);
        }

        .input-group {
            position: relative;
            margin-bottom: 25px;
        }

        .input-group i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--main-color);
            font-size: 1.1rem;
        }

        .input-group input {
            width: 100%;
            padding: 10px 10px 10px 35px;
            border: none;
            border-bottom: 2px solid #ccc;
            background: transparent;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            outline: none;
            border-bottom-color: var(--main-color);
        }

        .update-btn {
            width: 100%;
            padding: 10px;
            background-color: var(--main-color);
            color: white;
            font-size: 1rem;
            font-weight: bold;
            border: none;
            border-radius: 25px;
            margin-top: 10px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .update-btn:hover {
            background-color: var(--text-color);
            color: var(--bg-color);
            transform: scale(1.01);
        }

        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            .input-group input {
                font-size: 0.95rem;
            }

            .update-btn {
                font-size: 1rem;
            }
        }
    </style>
</head>

<body>
    <header>
        <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
            alt="OLA Electric" />
        <i class="bi bi-list menu-icon" onclick="toggleMenu()"></i>
    </header>
    <nav class="nav-menu" id="navMenu">
        <span class="close-btn" onclick="toggleMenu()">&times;</span>
        <a href="profileUpdate"><i class="bi bi-person-fill-up"></i> Update Profile</a>
        <a href="showrooms"><i class="bi bi-buildings-fill"></i> Showrooms</a>
        <a href="schedule"><i class="bi bi-hourglass"></i> Schedule</a>
        <a href="userDashBoard"><i class="bi bi-house-fill"></i> Home</a>
    </nav>

    <div class="container">
        <form action="updateProfile" method="post" enctype="multipart/form-data">
            <H3>UPDATE YOUR PROFILE</H3>
            <div class="input-group">
                <i class="bi bi-image"></i>
                <input type="file" name="file" id="imgProperty" accept=".jpg, .jpeg, .png">
            </div>

            <div class="input-group">
                <i class="bi bi-person"></i>
                <input type="text" id="customerName" name="customerName" placeholder="Enter Your Name" value="${getData.customerName}">
            </div>

            <div class="input-group">
                <i class="bi bi-calendar"></i>
                <input type="text" id="age" name="age" placeholder="Enter Your Age" value="${getData.age}">
            </div>

            <div class="input-group">
                <i class="bi bi-envelope"></i>
                <input type="text" id="email" name="email" placeholder="Enter Your Email" value="${getData.email}" readonly>
            </div>

            <div class="input-group">
                <i class="bi bi-telephone"></i>
                <input type="text" id="contactNo" name="contactNo" placeholder="Enter your Contact Number" value="${getData.contactNo}">
            </div>

            <div class="input-group">
                <i class="bi bi-geo-alt"></i>
                <input type="text" id="address" name="address" placeholder="Enter Your Address" value="${getData.address}">
            </div>

            <div class="input-group">
                <i class="bi bi-credit-card"></i>
                <input type="text" id="drivingLicense" name="drivingLicense" placeholder="Enter Your Driving License No" value="${getData.drivingLicense}" readonly>
            </div>

            <input type="submit" class="update-btn" id="submitBtn" value="UPDATE PROFILE">

        </form>
    </div>

    <script>
        function toggleMenu() {
            document.getElementById('navMenu').classList.toggle('show-menu');
        }
        window.onbeforeunload = () => {
            document.body.classList.remove('fadeIn');
        };
    </script>
</body>

</html>