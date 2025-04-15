<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Admin Login</title>
            <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                type="image/png" />
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

            <style>
                :root {
                    --main-color: #5c899d;
                    --bg-color: #fffcef;
                    --text-color: #2e4a56;
                    --input-line: #ccc;
                    --input-focus: #fff9e0;
                    --button-hover: #fff9e0;
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
                    justify-content: center;
                    align-items: center;
                    background: var(--main-color);
                    padding: 8px 15px;
                    width: 100%;
                    position: fixed;
                    top: 0;
                    left: 0;
                }

                header img {
                    height: 20px;
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

                .nav-menu {
                    position: fixed;
                    top: 50px;
                    right: -220px;
                    width: 180px;
                    background-color: var(--main-color);
                    padding: 15px;
                    border-radius: 8px 0 0 8px;
                    box-shadow: -2px 2px 10px rgba(0, 0, 0, 0.2);
                    transition: right 0.3s ease;
                    z-index: 1000;
                }

                .nav-menu a {
                    display: block;
                    color: white;
                    text-decoration: none;
                    margin: 10px 0;
                    font-weight: 500;
                }

                .nav-menu a:hover {
                    color: var(--input-focus);
                }

                .show-menu {
                    right: 0px !important;
                }

                .menu-icon {
                    font-size: 22px;
                    color: white;
                    margin-left: auto;
                    cursor: pointer;
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
                    margin-bottom: 20px;
                }

                .input-container {
                    position: relative;
                    margin-bottom: 20px;
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

                .send-otp-btn {
                    position: absolute;
                    right: 5px;
                    top: 50%;
                    transform: translateY(-50%);
                    background: transparent;
                    border: none;
                    cursor: pointer;
                    font-size: 20px;
                    color: var(--text-color);
                    transition: transform 0.2s ease;
                }

                .send-otp-btn:hover {
                    transform: translateY(-50%) scale(1.1);
                    color: var(--main-color);
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
                    margin-bottom: 5%;

                }

                .container .login-btn:hover {
                    background: var(--button-hover);
                    color: var(--text-color);
                    box-shadow: 0 0 10px var(--button-hover);
                    transform: scale(1.05);
                }

                .container .re-send-btn {
                    background: white;
                    color: var(--main-color);
                    font-weight: bold;
                    cursor: pointer;
                    transition: 0.3s;
                    padding: 4px 10px;
                    font-size: 13px;
                    border-radius: 5px;
                    border: none;
                    text-align: center;
                }

                .container .re-send-btn:hover {
                    background: var(--button-hover);
                    color: var(--text-color);
                    box-shadow: 0 0 6px var(--button-hover);
                }

                .eye-icon {
                    position: absolute;
                    right: 10px;
                    top: 50%;
                    transform: translateY(-50%);
                    cursor: pointer;
                    color: var(--bg-color);
                    font-size: 18px;
                }

                .timer-wrapper {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    margin-bottom: 5px;
                }

                #timer {
                    color: white;
                    font-size: 14px;
                    background-color: rgba(0, 0, 0, 0.2);
                    padding: 5px 10px;
                    border-radius: 5px;
                }

            </style>
        </head>

        <body>
            <header>
                <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                    alt="OLA Electric">
                <i class="bi bi-list menu-icon" onclick="toggleMenu()"></i>
            </header>
            <nav class="nav-menu" id="navMenu">
                <a href="index.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
            </nav>
            <div class="container">

                <!-- Admin Login Form (OTP SEND) -->
                <form id="adminLoginForm" action="adminLogin" method="post">
                    <h3>SHOWROOM ADMIN</h3>
                    <div class="input-container">
                        <input type="text" id="email" name="email" placeholder="Enter Admin Email Id"
                            value="${email}" />
                        <!-- CHANGED: type from submit to button -->
                        <button type="button" class="send-otp-btn" id="sendOtpBtn">
                            <i class="bi bi-arrow-right-circle-fill"></i>
                        </button>
                    </div>
                </form>

                <!-- OTP Verification Form -->
                <form action="verifyOtp" method="post" id="otpForm">
                    <input type="hidden" name="email" value="${email}" />
                    <div class="input-container">
                        <input type="password" id="otp" name="otp" placeholder="Enter OTP" />
                        <i class="bi bi-eye-slash eye-icon" id="toggleOtp"></i>
                    </div>
                    <div class="timer-wrapper">
                        <span id="timer" style="display: none;"></span>
                    </div>

                    <c:if test="${not empty error}">
                        <p style="color: red;">${error}</p>
                    </c:if>
                    <input type="submit" class="login-btn" id="submitBtn" value="Login">
                </form>

                <!-- Resend OTP -->
                <form action="resendOtp" id="resendOtpForm" method="post">
                    <input type="hidden" name="email" value="${email}" />
                    <input type="submit" class="re-send-btn" id="resendOtpBtn" value="Resend OTP">
                </form>
            </div>

           <script>
               function startTimer(duration) {
                   const timerDisplay = document.getElementById("timer");
                   let endTime = new Date().getTime() + duration * 1000;

                   localStorage.setItem("otpEndTime", endTime); // Save timer

                   function updateTimer() {
                       const now = new Date().getTime();
                       const remaining = Math.floor((endTime - now) / 1000);

                       if (remaining >= 0) {
                           let m = Math.floor(remaining / 60);
                           let s = remaining % 60;
                           m = m < 10 ? '0' + m : m;
                           s = s < 10 ? '0' + s : s;
                           timerDisplay.innerText = m + ':' + s;
                           timerDisplay.style.display = 'inline';
                           setTimeout(updateTimer, 1000);
                       } else {
                           timerDisplay.innerText = '00:00';
                           document.getElementById("otp").disabled = true;
                           document.getElementById("submitBtn").disabled = true;
                           alert("OTP expired! Please request a new one.");
                           localStorage.removeItem("otpEndTime");
                       }
                   }

                   updateTimer();
               }

               document.addEventListener("DOMContentLoaded", function () {
                   const otpInput = document.getElementById("otp");
                   const submitBtn = document.getElementById("submitBtn");
                   const timerDisplay = document.getElementById("timer");

                   // Disable login btn initially
                   submitBtn.disabled = true;

                   otpInput.addEventListener("input", function () {
                       submitBtn.disabled = otpInput.value.trim().length === 0;
                   });

                   // RESUME TIMER IF EXISTS
                   const savedEndTime = localStorage.getItem("otpEndTime");
                   if (savedEndTime) {
                       const now = new Date().getTime();
                       const remaining = Math.floor((savedEndTime - now) / 1000);
                       if (remaining > 0) {
                           startTimer(remaining); // Resume
                       } else {
                           localStorage.removeItem("otpEndTime");
                       }
                   }

                   // SEND OTP
                   document.getElementById("sendOtpBtn").addEventListener("click", function () {
                       localStorage.removeItem("otpEndTime"); // Reset any old timer
                       startTimer(120); // 2 min
                       document.getElementById("adminLoginForm").submit(); // Submit
                   });

                   // RESEND OTP
                   document.getElementById("resendOtpBtn").addEventListener("click", function () {
                       localStorage.removeItem("otpEndTime"); // Reset old timer
                       startTimer(120); // Restart timer for 2 minutes
                       document.getElementById("resendOtpForm").submit(); // Submit form
                   });


                   // Toggle OTP visibility
                   document.getElementById("toggleOtp").addEventListener("click", function () {
                       if (otpInput.type === "password") {
                           otpInput.type = "text";
                           this.classList.remove("bi-eye-slash");
                           this.classList.add("bi-eye");
                       } else {
                           otpInput.type = "password";
                           this.classList.remove("bi-eye");
                           this.classList.add("bi-eye-slash");
                       }
                   });
               });
           </script>

        </body>

        <script>
            function toggleMenu() {
                const menu = document.getElementById('navMenu');
                menu.classList.toggle('show-menu');
            }
        </script>

        </html>