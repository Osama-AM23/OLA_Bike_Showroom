<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot_password</title>
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
            padding: 0;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            animation: fadeInUp 1s ease-in-out;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: var(--main-color);
            color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        header img {
            height: 20px;
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

            max-width: 500px;
            margin: 40px auto;
            padding: 70px;
            border-radius: 8px;
            background-color: var(--bg-color);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: var(--text-color);
        }

        .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            border-bottom: 2px solid var(--input-line);
            transition: border-color 0.3s ease;
        }

        .input-group:hover {
            border-color: var(--main-color);
        }

        .input-group i {
            margin-right: 10px;
            font-size: 20px;
            color: var(--text-color);
        }

        .input-group input {
            flex: 1;
            border: none;
            font-size: 16px;
            color: var(--text-color);
            background: none;
            outline: none;
            padding: 5px 0;
        }

        .input-group input::placeholder {
            font-size: 12px;
            color: var(--input-line);
            transition: font-size 0.3s ease;
        }

        .input-group input:focus::placeholder {
            font-size: 10px;
        }

        .container input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: var(--input-focus);
            color: black;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        .container input[type="submit"]:hover {
            background-color: var(--text-color);
            color: var(--bg-color);
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.25);
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

        .error-msg {
            color: red;
            font-size: 10px;
            font-weight: bold;
            display: block;
            margin-top: 2px;
            text-align: left;
            width: 100%;
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
        <form action="forgotPassword" method="post">
            <h2>RESET PASSWORD</h2>
            <h4>Reset Your Password If you Forgot Them</h4>
            <div class="input-group">
                <i class="bi bi-envelope"></i>
                <input type="text" name="email" id="email" placeholder="Enter Your Email">
            </div>
            <div class="input-group">
                <i class="bi bi-key"></i>
                <input type="password" name="password" id="password" onchange="onPassword()"
                    placeholder="Set New Password">
                <i class="bi bi-eye-slash eye-icon" id="togglePassword"
                    style="cursor: pointer; font-size: 17px; color: var(--main-color);"></i>
            </div>
            <span id="passwordError" class="error-msg"></span>
            <div class="input-group">
                <i class="bi bi-key"></i>
                <input type="password" name="confirmPassword" id="confirmPassword" onchange="onConfirmPassword()"
                    placeholder="Enter Your Confirm Password">
            </div>
            <span id="confirmPasswordError" class="error-msg"></span>
            <input type="submit" id="submitBtn" value="RESET">
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

    <script>
        function onPassword() {
            console.log('Password form Ajax and Js');
            var name = document.getElementById('password');
            var passwordValue = name.value;
            var confirmPasswordValue = document.getElementById('confirmPassword').value;
            var confirmPasswordError = document.getElementById("confirmPasswordError");
            var passwordError = document.getElementById("passwordError");
            var submitBtn = document.getElementById("submitBtn");

            var upperLowerPattern = /^(?=.*[a-z])(?=.*[A-Z])/;
            var digitSpecialPattern = /^(?=.*\d)(?=.*[!@#$%^&*+_?])/;
            var lengthPattern = /^.{5,15}$/;


            if (passwordValue === "") {
                passwordError.innerHTML = "Password is Required *";
            } else if (!upperLowerPattern.test(passwordValue)) {
                passwordError.innerHTML = "Password Start From UpperCase Only";
                submitBtn.disabled = true;
            } else if (!digitSpecialPattern.test(passwordValue)) {
                passwordError.innerHTML = "Password should Contain number and Special Character";
                submitBtn.disabled = true;
            } else if (!lengthPattern.test(passwordValue)) {
                passwordError.innerHTML = "Password Length is 05 to 15 Between!";
            } else if (confirmPasswordValue !== "" && passwordValue !== confirmPasswordValue) {
                confirmPasswordError.innerHTML = "Password & Confirm Password Should Be Same!";
                submitBtn.disabled = true;

            } else {
                passwordError.innerHTML = "";
                console.log('All Pattern is Matches And Passwords Matched');
                submitBtn.disabled = false;
            }
        }
    </script>
</body>

</html>