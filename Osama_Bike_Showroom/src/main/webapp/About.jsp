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
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            margin: 0;
            padding: 0;
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

        h2 {
            text-align: center;
            margin-top: 30px;
            font-size: 2rem;
            animation: fadeInUp 1.4s ease-in-out;
        }

        p {
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
            line-height: 1.6;
            font-size: 1rem;
            animation: fadeInUp 1.6s ease-in-out;
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


    <h2>ABOUT THE PROJECT</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum animi eveniet saepe minima quaerat facilis quod
        iusto amet quae totam.</p>

</body>

</html>