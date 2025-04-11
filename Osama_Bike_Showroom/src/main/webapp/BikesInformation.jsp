<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bikes_Information</title>
        <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
            type="image/png" />
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

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
                height: 20px;
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

            .container {
                margin-top: 40px;
                padding: 0 20px;
            }

            .bikes-title {
                font-size: 28px;
                margin-bottom: 20px;
                color: var(--text-color);
            }

            .bike-cards {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
            }

            .bike-card {
                border: 1px solid #ccc;
                border-radius: 12px;
                padding: 20px;
                width: 300px;
                background-color: var(--table-bg);
                box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s ease-in-out;
            }

            .bike-card:hover {
                transform: scale(1.02);
            }

            .bike-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 10px;
                margin-bottom: 10px;
            }

            .bike-card h4 {
                color: var(--text-color);
                margin: 10px 0 5px;
            }

            .bike-card p {
                margin: 4px 0;
                font-size: 14px;
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
            <a href="addShowRoom"><i class="bi bi-plus-circle-fill"></i> Add Showroom</a>
            <a href="addBikeDetails"><i class="bi bi-plus-circle-fill"></i> Add Bike Details</a>
            <a href="getDetails"><i class="bi bi-box-arrow-in-right"></i> Assign Bike to Showroom</a>
            <a href="register"><i class="bi bi-person-plus-fill"></i> Registration</a>
            <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
        </nav>
<%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Bikes_Information</title>
                <link rel="icon"
                    href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                    type="image/png" />
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

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
                        height: 20px;
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

                    .container {
                        margin-top: 40px;
                        padding: 0 20px;
                        margin-bottom: 60px;
                    }

                    .bikes-title {
                        font-size: 28px;
                        margin-bottom: 20px;
                        color: var(--text-color);
                    }

                    .bike-cards {
                        display: flex;
                        flex-wrap: wrap;
                        justify-content: center;
                        gap: 20px;
                    }

                    .bike-card {
                        border: 1px solid #ccc;
                        border-radius: 12px;
                        padding: 20px;
                        width: 300px;
                        background-color: var(--table-bg);
                        box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
                        transition: transform 0.2s ease-in-out;
                    }

                    .bike-card:hover {
                        transform: scale(1.02);
                    }

                    .bike-card img {
                        display: block;
                        margin: 0 auto;
                    }


                    .bike-card h4 {
                        color: var(--text-color);
                        margin: 10px 0 5px;
                    }

                    .bike-card p {
                        margin: 4px 0;
                        font-size: 14px;
                    }

                    .image-carousel {
                        position: relative;
                        width: 75%;
                        height: auto;
                        overflow: hidden;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto;
                    }

                    .carousel-images {
                        width: 200%;
                        height: auto;
                        display: flex;
                        position: relative;
                    }

                    .carousel-images img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        display: none;
                        border-radius: 10px;
                    }

                    .carousel-images img.active {
                        display: block;
                    }

                    .arrow {
                        position: absolute;
                        top: 50%;
                        transform: translateY(-50%);
                        font-size: 22px;
                        background-color: var(--main-color);
                        color: white;
                        border: none;
                        padding: 10px 5px;
                        border-radius: 30%;
                        cursor: pointer;
                        z-index: 1;
                        opacity: 0.8;
                        transition: 0.3s ease-in-out;
                    }

                    .arrow:hover {
                        opacity: 1;
                    }

                    .arrow.left {
                        left: 5px;
                    }

                    .arrow.right {
                        right: 5px;
                    }

                    /* Responsive tweaks */
                    @media (max-width: 768px) {
                        .bike-card {
                            width: 90%;
                        }
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
                    <a href="addShowRoom"><i class="bi bi-plus-circle-fill"></i> Add Showroom</a>
                    <a href="addBikeDetails"><i class="bi bi-plus-circle-fill"></i> Add Bike Details</a>
                    <a href="getDetails"><i class="bi bi-box-arrow-in-right"></i> Assign Bike to Showroom</a>
                    <a href="register"><i class="bi bi-person-plus-fill"></i> Registration</a>
                    <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
                </nav>

                <div class="container">
                    <h2 class="bikes-title">Bikes Information</h2>
                    <div class="bike-cards">
                        <c:forEach var="bike" items="${info}">
                            <div class="bike-card">
                                <div class="image-carousel">
                                    <button class="arrow left" onclick="prevImage(this)">&#8249;</button>
                                    <div class="carousel-images">
                                        <c:forEach var="img" items="${fn:split(bike.imgPaths, ',')}" varStatus="loop">
                                            <img src="imageDisplay?imgPaths=${img}"
                                                class="${loop.index == 0 ? 'active' : ''}" />
                                        </c:forEach>
                                    </div>
                                    <button class="arrow right" onclick="nextImage(this)">&#8250;</button>
                                </div>

                                <h4>${bike.bikeName}</h4>
                                <p><strong>Year:</strong> ${bike.year}</p>
                                <p><strong>Range:</strong> ${bike.bikeRange}</p>
                                <p><strong>Motor Power:</strong> ${bike.motorPower}</p>
                                <p><strong>Price:</strong> ₹${bike.price}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <script>
                    function nextImage(btn) {
                        const carousel = btn.closest('.image-carousel');
                        const images = carousel.querySelectorAll('img');
                        let currentIndex = Array.from(images).findIndex(img => img.classList.contains('active'));
                        images[currentIndex].classList.remove('active');
                        const nextIndex = (currentIndex + 1) % images.length;
                        images[nextIndex].classList.add('active');
                    }

                    function prevImage(btn) {
                        const carousel = btn.closest('.image-carousel');
                        const images = carousel.querySelectorAll('img');
                        let currentIndex = Array.from(images).findIndex(img => img.classList.contains('active'));
                        images[currentIndex].classList.remove('active');
                        const prevIndex = (currentIndex - 1 + images.length) % images.length;
                        images[prevIndex].classList.add('active');
                    }
                </script>

            </body>
            <script>
                function toggleMenu() {
                    const menu = document.getElementById('navMenu');
                    menu.classList.toggle('show-menu');
                }
            </script>

            </html>

    </body>
    <script>
        function toggleMenu() {
            const menu = document.getElementById('navMenu');
            menu.classList.toggle('show-menu');
        }
    </script>
    </html>