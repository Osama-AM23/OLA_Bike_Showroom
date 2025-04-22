<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User_DashBoard</title>
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
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 1s ease-out forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
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

        .email-text {
            font-size: 12px;
            color: #fff;
            transition: color 0.3s, text-decoration 0.3s;
        }

        .email-text:hover {
            color: var(--text-color);
        }

        main {
            margin-top: 80px;
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            font-size: 5.5rem;
            margin-bottom: 30px;
            text-align: center;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            width: 100%;
            max-width: 1000px;
        }

        .card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
            text-align: center;
        }

        .video-card-section {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 70px 40px;
            background: var(--bg-color);
        }

        .video-card {
            max-width: 500px;
            width: 100%;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.15);
            background: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .video-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .video-card video {
            width: 100%;
            height: auto;
            display: block;
        }

        .video-card-content {
            padding: 15px;
            text-align: center;
            background-color: var(--bg-color);
        }

        .video-card-content p {
            font-size: 18px;
            font-weight: 500;
            color: var(--text-color);
        }


        footer {
            background: var(--main-color);
            color: white;
            text-align: center;
            padding: 12px;
            margin-top: auto;
        }
    </style>
</head>

<body>
    <header>
        <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
            alt="OLA Electric" />
        <a href="index.jsp" class="header-btn">
            <span class="email-text"><i class="bi bi-person-circle"></i> ${email}</span>
            <i class="bi bi-house-fill"></i>
        </a>
    </header>

    <main>
        <h1>Welcome To Our OLA Electric</h1>

        <div class="card-container">
            <div class="card">
                <img src="https://cdn.olaelectric.com/sites/evdp/pages/bike/motorcycle_page_banner_web_image.webp"
                    alt="Bike 1">
                <div class="card-content">
                    <p>Electric Bike Roadster</p>
                </div>
            </div>

            <div class="card">
                <img src="https://cdn.olaelectric.com/sites/evdp/pages/gig/home_banner_gig_web_image_v2.webp"
                    alt="Bike 3">
                <div class="card-content">
                    <p>Riding Towards | Gig</p>
                </div>
            </div>
        </div>
    </main>

    <div class="video-card-section">
        <div class="video-card">
            <video autoplay muted loop playsinline>
                <source src="https://cdn.olaelectric.com/sites/evdp/pages/bike/roadster/roadtser_web_video.mp4"
                    type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <div class="video-card-content">
                <p>Roadster Electric Experience</p>
            </div>
        </div>
    </div>


    <footer>
        &copy; 2025 Bike Showroom. All rights reserved.
    </footer>
</body>

</html>