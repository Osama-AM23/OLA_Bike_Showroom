<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Showroom_Details</title>
    <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
        type="image/png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        :root {
            --main-color: #5c899d;
            --bg-color: #fffcef;
            --text-color: #2e4a56;
            --card-hover: #e0f1f7;
        }

        body {
            margin: 0;
            font-family: system-ui, sans-serif;
            background: var(--bg-color);
            color: var(--text-color);
            text-align: center;
            padding-top: 80px;
            animation: fadeInPage 0.8s ease-in;
        }

        @keyframes fadeInPage {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        header {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: var(--main-color);
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
        }

        .email-text {
            font-size: 12px;
            color: white;
            margin-left: auto;
            margin-right: 10px;
        }

        .menu-icon {
            font-size: 24px;
            color: white;
            cursor: pointer;
        }

        .nav-menu {
            position: fixed;
            top: 0;
            right: -250px;
            width: 250px;
            height: 100%;
            background: var(--main-color);
            padding-top: 60px;
            display: flex;
            flex-direction: column;
            text-align: center;
            transition: right 0.3s ease-in-out;
        }

        .nav-menu a {
            color: #fff;
            font-size: 17px;
            text-decoration: none;
            padding: 12px;
            transition: background 0.3s ease;
        }

        .nav-menu a:hover {
            background: var(--card-hover);
            color: var(--text-color);
        }

        .show-menu {
            right: 0;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 30px 20px;
        }

        .container h2 {
            font-size: 28px;
            margin-bottom: 30px;
        }

        .card-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
        }

        .card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            width: 300px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: popUp 0.6s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            background-color: var(--card-hover);
        }

        .card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 12px;
        }

        .card h4 {
            margin: 5px 0;
            font-size: 16px;
            color: #2e4a56;
        }

        @keyframes popUp {
            from {
                opacity: 0;
                transform: scale(0.9) translateY(20px);
            }
            to {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }

        @media screen and (max-width: 960px) {
            .card-grid {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>

<body>
    <header>
        <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg" alt="OLA Electric">
        <span class="email-text">${sessionScope.email}</span>
        <i class="bi bi-list menu-icon" onclick="toggleMenu()"></i>
    </header>

    <nav class="nav-menu" id="navMenu">
        <a href="addShowRoom"><i class="bi bi-plus-circle-fill"></i> Add Showroom</a>
        <a href="addBikeDetails"><i class="bi bi-plus-circle-fill"></i> Add Bike Details</a>
        <a href="bikesInformation"><i class="bi bi-bicycle"></i> Bikes Information</a>
        <a href="getDetails"><i class="bi bi-box-arrow-in-right"></i> Assign Bike to Showroom</a>
        <a href="register"><i class="bi bi-person-plus-fill"></i> Registration</a>
        <a href="followUp"><i class="bi bi-person-lines-fill"></i> Follow Up</a>
        <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
    </nav>

    <div class="container">
        <h2>SHOWROOM DETAILS</h2>

        <div class="card-grid">
            <c:forEach items="${display}" var="display">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/display?imgPath=${display.imgPath}" alt="Showroom Image" />
                    <h4>SHOWROOM: ${display.showroomName}</h4>
                    <h4>ADDRESS: ${display.address}</h4>
                    <h4>CITY: ${display.city}</h4>
                    <h4>CONTACT: ${display.contact}</h4>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        function toggleMenu() {
            document.getElementById('navMenu').classList.toggle('show-menu');
        }
    </script>
</body>

</html>
