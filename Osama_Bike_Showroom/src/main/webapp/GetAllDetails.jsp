<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign_Bikes</title>
    <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
        type="image/png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
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
            background: var(--main-color);
            padding: 12px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        header img {
            height: 40px;
            width: auto;
            transition: transform 0.3s ease-in-out;
        }

        header img:hover {
            transform: scale(1.1);
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

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        table {
            width: 90%;
            max-width: 900px;
            border-collapse: collapse;
            background: var(--table-bg);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            animation: slideIn 0.8s ease-in-out;
        }

        @keyframes slideIn {
            from {
                transform: scale(0.9);
                opacity: 0;
            }

            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        th,
        td {
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: var(--main-color);
            color: var(--bg-color);
            font-weight: bold;
            text-transform: uppercase;
        }

        tbody tr {
            transition: background 0.3s ease-in-out, transform 0.2s;
        }

        tbody tr:hover {
            background: var(--table-hover);
            transform: scale(1.02);
        }

        td:last-child {
            text-align: center;
        }

        .assign-icon {
            font-size: 22px;
            color: var(--main-color);
            transition: transform 0.2s ease-in-out, color 0.3s;
        }

        .assign-icon:hover {
            transform: scale(1.2);
            color: #29424f;
        }

        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            th,
            td {
                padding: 10px;
            }
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

    <h2>SHOWROOM DETAILS</h2>

    <table>
        <thead>
            <tr>
                <th>S.NO</th>
                <th>Showroom</th>
                <th>Address</th>
                <th>City</th>
                <th>Contact</th>
                <th>Assign</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${lists}" var="showroom">
                <tr>
                    <td>${showroom.id}</td>
                    <td>${showroom.showroomName}</td>
                    <td>${showroom.address}</td>
                    <td>${showroom.city}</td>
                    <td>${showroom.contact}</td>
                    <td>
                        <a href="assignBikes?address=${showroom.address}">
                            <i class="bi bi-plus-square-fill assign-icon"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
<script>
        function toggleMenu() {
            const menu = document.getElementById('navMenu');
            menu.classList.toggle('show-menu');
        }
    </script>
</html>
