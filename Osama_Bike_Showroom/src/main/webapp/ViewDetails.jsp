<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>View_Details</title>
            <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                type="image/png" />
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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
                    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
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
                    background-color: var(--main-color);
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
                    color: var(--bg-color);
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

                .back-button {
                    position: absolute;
                    top: 60px;
                    left: 10px;
                    background-color: var(--main-color);
                    color: var(--bg-color);
                    padding: 10px 15px;
                    border-radius: 2px;
                    font-size: 13px;
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    box-shadow: 0 0 10px var(--main-color);
                    transition: all 0.3s ease-in-out;
                    animation: slideInLeft 0.6s ease-in-out;
                }

                .back-button:hover {
                    box-shadow: 0 0 20px #527783;
                    transform: scale(1.05);
                    background-color: #9fd6e9;
                    color: var(--text-color);
                }

                @keyframes slideInLeft {
                    from {
                        transform: translateX(-50px);
                        opacity: 0;
                    }

                    to {
                        transform: translateX(0);
                        opacity: 1;
                    }
                }

                table {
                    width: 60%;
                    margin: 50px auto;
                    border-collapse: collapse;
                    background-color: var(--table-bg);
                    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
                    border-radius: 2px;
                    overflow: hidden;
                    animation: slideInUp 0.6s ease-in-out;
                }

                thead {
                    background-color: var(--main-color);
                    color: white;
                }

                th,
                td {
                    padding: 15px 25px;
                    text-align: center;
                    border-bottom: 1px solid var(--main-color);
                    font-size: 12px;
                }

                tbody tr:hover {
                    background-color: var(--table-hover);
                    transform: scale(1.01);
                    transition: all 0.2s ease-in-out;
                }

                th {
                    font-weight: bold;
                    letter-spacing: 0.6px;
                    font-size: 12px;
                }

                td {
                    color: var(--text-color);
                }

                tbody tr {
                    transition: all 0.3s ease;
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
                <span class="close-btn" onclick="toggleMenu()">&times;</span>
                <a href="addShowRoom"><i class="bi bi-plus-circle-fill"></i> Add Showroom</a>
                <a href="addBikeDetails"><i class="bi bi-plus-circle-fill"></i> Add Bike Details</a>
                <a href="getDetails"><i class="bi bi-box-arrow-in-right"></i> Assign Bike to Showroom</a>
                <a href="register"><i class="bi bi-person-plus-fill"></i> Registration</a>
                <a href="followUp"><i class="bi bi-person-lines-fill"></i>Follow Up</a>
                <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
            </nav>
            <a href="followUp" class="back-button">
                <i class="bi bi-arrow-left-circle-fill"></i> Back
            </a>

            <h2>UPDATE HISTORY</h2>

            <table>
                <thead>
                    <tr>
                        <th>SL.NO</th>
                        <th>CUSTOMER NAME</th>
                        <th>REASON</th>
                        <th>RE-SCHEDULED</th>
                        <th>UPDATED TIME</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${view}" var="data" varStatus="status">
                        <tr>
                            <td>${status.index +1}</td>
                            <td>${data.customerName}</td>
                            <td>${data.reason}</td>
                            <td>${data.reScheduledDay}</td>
                            <td>${data.updatedTiming}</td>
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