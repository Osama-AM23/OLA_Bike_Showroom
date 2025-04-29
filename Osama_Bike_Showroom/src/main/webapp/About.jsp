<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project-About</title>
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
            --glow-color: #9dc0d4;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        header img {
            height: 30px;
            animation: fadeIn 1.2s ease-in-out;
        }

        .header-btn {
            font-size: 16px;
            font-weight: 500;
            color: white;
            text-decoration: none;
            background: none;
            border: none;
            cursor: pointer;
            padding: 10px 14px;
            display: flex;
            align-items: center;
            gap: 8px;
            position: relative;
            transition: color 0.3s ease, box-shadow 0.3s ease;
        }

        .header-btn:hover {
            color: var(--button-hover);
            text-shadow: 0 0 5px var(--glow-color);
        }

        .header-btn i {
            font-size: 18px;
        }

        .about-card,
        .project-card,
        .user-card,
        .tech-card {
            max-width: 960px;
            margin: 40px auto;
            background-color: white;
            padding: 30px 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            animation: fadeInUp 1.2s ease-in-out;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .about-card:hover,
        .project-card:hover,
        .user-card:hover,
        .tech-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 20px;
            position: relative;
        }

        h2::after {
            content: "";
            display: block;
            width: 60px;
            height: 3px;
            background-color: var(--main-color);
            margin: 10px auto 0;
            border-radius: 3px;
        }

        p {
            font-size: 1rem;
            line-height: 1.6;
            margin: 10px 0;
            padding: 0 5px;
            animation: fadeInUp 1.6s ease-in-out;
        }

        p strong {
            color: var(--main-color);
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }

            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px;
            }

            .header-btn {
                margin-top: 10px;
            }

            h2 {
                font-size: 1.5rem;
            }

            .about-card,
            .project-card,
            .user-card,
            .tech-card {
                margin: 20px 15px;
                padding: 20px;
            }

            p {
                font-size: 0.95rem;
            }
        }

        @media (max-width: 480px) {
            .header-btn {
                font-size: 14px;
                padding: 8px 10px;
            }

            h2 {
                font-size: 1.3rem;
            }

            p {
                font-size: 0.9rem;
            }
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

    <div class="about-card">
        <h2>ABOUT THE PROJECT</h2>
        <p>Admin Portal: Admin logs in with email, verifies OTP sent to email, and then manages bikes, showrooms, and
            user
            records.</p>
        <p>User Portal: Users register/login, with password encryption during registration and decryption during login.
            They
            can update their profile, schedule a test drive or bike booking, and explore available bikes and showroom
            details.</p>
        <p>Validations are applied using JS, AJAX, and Spring validation.</p>
        <p>Proper logging is done using Logger for critical activities like login, schedule, etc.</p>
    </div>

    <div class="project-card">
        <h2>PROJECT MODULES</h2>
        <p><strong>Admin Portal</strong></p>
        <p>Admin Login → Email + OTP Verification</p>
        <p>Admin Dashboard (after OTP Verification)</p>
        <p>Add / Update / Bikes</p>
        <p>Add / Update / Showroom</p>
        <p>View Registered Users</p>
        <p>View Scheduled Test Drives / Bookings</p>
    </div>

    <div class="user-card">
        <p><strong>User Portal</strong></p>
        <p>User Registration (Password encryption)</p>
        <p>User Login (Password decryption check)</p>
        <p>Update Profile</p>
        <p>Explore Bikes</p>
        <p>View Showroom Details</p>
        <p>Schedule Test Drive </p>
    </div>

    <div class="tech-card">
        <h2>TECHONOLOGIES USED</h2>

        <P><strong>BACK-END :</strong> Java, Spring-MVC, Lombok, Service Layer, DAO Layer, Loggers.</P>
        <p><strong>FRONT-END :</strong>JSP, CSS, JS Validation, AJAX</p>
        <p><strong>DATABASE :</strong>MySQL</p>
        <p><strong>IDE :</strong>IntelliJ IDEA</p>
    </div>

</body>

</html>