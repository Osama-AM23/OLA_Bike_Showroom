<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User_login</title>
    <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
        type="image/png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        :root {
            --main-color: #5c899d;
            --bg-color: #fffcef;
            --text-color: #2e4a56;
            --input-line: #ccc;
            --input-focus: #fff9e0;
            --button-hover: #fff9e0;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            margin: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            background: var(--bg-color);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            text-align: center;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--main-color);
            padding: 8px 20px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .header-btn {
            position: relative;
            font-size: 16px;
            font-weight: 500;
            color: white;
            text-decoration: none;
            background: none;
            border: none;
            cursor: pointer;
            padding: 8px 12px;
            transition: color 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .header-btn i {
            font-size: 18px;
        }

        .header-btn::before,
        .header-btn::after {
            content: "";
            position: absolute;
            left: 0;
            right: 0;
            height: 2px;
            background-color: white;
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .header-btn::before {
            top: 0;
            transform-origin: left;
        }

        .header-btn::after {
            bottom: 0;
            transform-origin: right;
        }

        .header-btn:hover::before,
        .header-btn:hover::after {
            transform: scaleX(1);
        }

        .header-btn:hover {
            color: #fff9e0;
        }

        .container {
            background: var(--main-color);
            padding: 30px 30px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            width: 480px;
            margin-top: 80px;
        }

        .container h3 {
            color: white;
            margin-bottom: 30px;
        }

        .input-container {
            position: relative;
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .input-container input {
            width: 100%;
            padding: 10px 40px 10px 35px;
            box-sizing: border-box;
        }


        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 10px 5px;
            border: none;
            border-bottom: 2px solid var(--input-line);
            background: transparent;
            color: white;
            font-size: 16px;
            outline: none;
            transition: all 0.3s ease;
        }

        .container input[type="text"]:focus,
        .container input[type="password"]:focus {
            border-bottom: 2px solid var(--input-focus);
        }

        .container .login-btn {
            background: white;
            color: var(--main-color);
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            padding: 6px 12px;
            font-size: 16px;
            border-radius: 4px;
            border: none;
            margin-top: 10%;
            margin-bottom: 2%;

        }

        .container .login-btn:hover {
            background: var(--button-hover);
            color: var(--text-color);
            box-shadow: 0 0 10px var(--button-hover);
            transform: scale(1.05);
        }

        .input-container input {
            padding-left: 15%;
        }

        .input-container input::placeholder {
            text-align: left;
            font-size: 12px;
            font-style: italic;
            color: #555;
        }


        .input-container input {
            width: 100%;
            padding: 10px 40px 10px 35px;
            border: none;
            border-bottom: 2px solid #007bff;
            outline: none;
            background: transparent;
            font-size: 14px;
            color: #000;
        }


        .eye-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--bg-color);
            font-size: 14px;
        }

        .right-img {
            position: fixed;
            bottom: 0;
            right: 0;
            z-index: 10;
        }

        .right-img img {
            width: 370px;
            height: auto;
            display: block;
        }
    </style>
</head>

<body>
    <header>
        <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
            alt="OLA Electric" />
        <a href="index.jsp" class="header-btn">
            <i class="bi bi-house-fill"></i>Home
        </a>
    </header>

    <div class="container">
        <form action="userLogin" method="post">
            <h3>USER LOGIN</h3>
            <p style="color:red">${error}</p>
                <c:if test="${not empty errorMessage}">
            <div class="error-message">
                <p>${errorMessage}</p>
            </div>
            <div class="input-container">
                <input type="text" id="email" name="email" placeholder="Enter Your Email">
            </div>

            <div class="input-container">
                <input type="password" id="password" name="password" placeholder="Enter your Password" />
                <i class="bi bi-eye-slash eye-icon" id="togglePassword"></i>
            </div>


            <input type="submit" class="login-btn" id="submitBtn" value="LOGIN">
        </form>
    </div>
    <div class="right-img">
        <img src="https://i.ibb.co/TMf6Mkrh/home-experience-center-bg-v2-Photoroom.png" alt="Experience Center" />
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const passwordInput = document.getElementById("password");
            const toggleIcon = document.getElementById("togglePassword");

            toggleIcon.addEventListener("click", function () {
                const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
                passwordInput.setAttribute("type", type);
                this.classList.toggle("bi-eye");
                this.classList.toggle("bi-eye-slash");
            });
        });
    </script>
</body>

</html>