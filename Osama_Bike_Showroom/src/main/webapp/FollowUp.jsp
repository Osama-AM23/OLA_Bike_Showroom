<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Follow_Up</title>
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

                .email-text {
                    font-size: 12px;
                    color: #000;
                	transition: color 0.3s, text-decoration 0.3s;
                	margin-left: 90px;
                }

                .email-text:hover {
                	color: var(--main-color);
                	text-decoration: underline;
                }

                .filter-container {
                    width: 80%;
                    display: flex;
                    justify-content: flex-start;
                    align-items: center;
                    margin: 20px auto 10px auto;
                    animation: fadeInLeft 0.7s ease;
                }

                .filter-container label {
                    font-weight: bold;
                    color: var(--text-color);
                    margin-right: 10px;
                    font-size: 12px;
                    display: flex;
                    align-items: center;
                }

                .filter-container i {
                    margin-right: 6px;
                    color: var(--text-color);
                    font-size: 12px;
                    transition: transform 0.3s ease;
                }

                .filter-container select {
                    padding: 6px 12px;
                    border: 1px solid var(--main-color);
                    border-radius: 6px;
                    background-color: white;
                    color: var(--text-color);
                    font-size: 13px;
                    transition: all 0.3s ease;
                    box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
                    cursor: pointer;
                }

                .filter-container select:hover {
                    background-color: #96becf;
                    color: black;
                    border-color: var(--main-color);
                }

                .filter-container select:focus {
                    outline: none;
                    box-shadow: 0px 0px 5px var(--main-color);
                }

                .filter-container label:hover i {
                    transform: scale(1.2) rotate(-10deg);
                    color: #88c6e1;
                }

                @keyframes fadeInLeft {
                    0% {
                        transform: translateX(-30px);
                        opacity: 0;
                    }

                    100% {
                        transform: translateX(0);
                        opacity: 1;
                    }
                }


                table {
                    width: 22%;
                    margin: 50px auto;
                    border-collapse: collapse;
                    background-color: var(--table-bg);
                    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
                    border-radius: 4px;
                    overflow: hidden;
                    animation: slideInUp 0.6s ease-in-out;
                }

                thead {
                    background-color: var(--main-color);
                    color: white;
                }

                th,
                td {
                    padding: 7px 8px;
                    text-align: center;
                    border-bottom: 1px solid #ddd;
                    font-size: 10px;
                }

                tbody tr:hover {
                    background-color: var(--table-hover);
                    transform: scale(1.0);
                    transition: all 0.2s ease-in-out;
                }

                th {
                    font-weight: bold;
                    letter-spacing: 0.4px;
                    font-size: 10px;
                }

                td {
                    color: #333;
                }

                tbody tr {
                    transition: all 0.3s ease;
                }

                input[type="submit"][value="UPDATE"] {
                    background-color: var(--main-color);
                    color: white;
                    border: none;
                    padding: 7px 9px;
                    border-radius: 4px;
                    font-size: 11px;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                }

                input[type="submit"][value="UPDATE"]:hover {
                    background-color: #619bb6;
                }

                .view-button {
                    display: inline-block;
                    padding: 2px 10px;
                    font-size: 8px;
                    color: var(--main-color);
                    text-decoration: none;
                    border: 2px solid var(--main-color);
                    border-radius: 2px;
                    transition: background-color 0.3s ease, color 0.3s ease;
                    font-weight: bold;
                }

                .view-button:hover {
                    background-color: #e6f1f5;
                    color: rgb(89, 135, 141);
                }

                input[type="date"] {
                    width: 100%;
                    padding: 4px 10px;
                    border: 1px solid var(--main-color);
                    border-radius: 4px;
                    background-color: var(--table-hover);
                    color: var(--text-color);
                    font-size: 12px;
                    font-family: inherit;
                    transition: border-color 0.3s ease, box-shadow 0.3s ease;
                }

                input[type="date"]:focus {
                    border-color: var(--main-color);
                    box-shadow: 0 0 0 3px rgba(92, 137, 157, 0.3);
                    outline: none;
                }

                input[type="date"]:hover {
                    border-color: #4a7384;
                }

                input[type="date"]:disabled {
                    background-color: #eee;
                    color: #999;
                    cursor: not-allowed;
                }


                select#scheduleTime {
                    width: 100%;
                    padding: 7px 5px;
                    border: 1px solid var(--main-color);
                    border-radius: 6px;
                    background-color: var(--table-hover);
                    font-size: 13px;
                    color: #333;
                    transition: border-color 0.3s ease, box-shadow 0.3s ease;
                }

                select#scheduleTime:focus {
                    border-color: var(--table-bg);
                    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.2);
                    outline: none;
                }

                select#scheduleTime option {
                    padding: 8px;
                }

                select#scheduleTime:hover {
                    border-color: #888;
                }

                select#scheduleTime:disabled {
                    background-color: #eee;
                    color: #999;
                    cursor: not-allowed;
                }

                textarea.description-input {
                    width: 90%;
                    min-height: 60px;
                    padding: 10px 10px;
                    border: 1px solid var(--main-color);
                    border-radius: 6px;
                    background-color: var(--bg-color);
                    color: var(--text-color);
                    font-size: 11px;
                    font-family: inherit;
                    resize: vertical;
                    transition: border-color 0.3s ease, box-shadow 0.3s ease;
                }

                textarea.description-input:focus {
                    border-color: var(--main-color);
                    box-shadow: 0 0 0 3px rgba(92, 137, 157, 0.3);
                    outline: none;
                }

                textarea.description-input:hover {
                    border-color: #4a7384;
                }

                textarea.description-input:disabled {
                    background-color: #eee;
                    color: #999;
                    cursor: not-allowed;
                }

                .description-reason {
                    display: block;
                    margin-top: 4px;
                    font-size: 11px;
                    color: #777;
                    font-style: italic;
                }



                @media screen and (max-width: 768px) {
                    table {
                        width: 100%;
                        font-size: 11px;
                    }

                    th,
                    td {
                        padding: 10px 12px;
                    }
                }

                @keyframes slideInUp {
                    0% {
                        transform: translateY(40px);
                        opacity: 0;
                    }

                    100% {
                        transform: translateY(0);
                        opacity: 1;
                    }
                }
            </style>
        </head>

        <body>
            <header>
                <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                    alt="OLA Electric">
                    <span class="email-text">Admin:${sessionScope.email}</span>
                <i class="bi bi-list menu-icon" onclick="toggleMenu()"></i>
            </header>

            <nav class="nav-menu" id="navMenu">
                <a href="addShowRoom"><i class="bi bi-plus-circle-fill"></i> Add Showroom</a>
                <a href="addBikeDetails"><i class="bi bi-plus-circle-fill"></i> Add Bike Details</a>
                <a href="bikesInformation"><i class="bi bi-bicycle"></i>Bikes Information</a>
                <a href="getDetails"><i class="bi bi-box-arrow-in-right"></i> Assign Bike to Showroom</a>
                <a href="register"><i class="bi bi-person-plus-fill"></i> Registration</a>
                <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
            </nav>

            <h2>REGISTER DETAILS</h2>
            <div class="filter-container">
                <label for="filterSchedule">
                    <i class="bi bi-funnel-fill"></i> Filter:
                </label>
                <select id="filterSchedule" onchange="filterTable()">
                    <option value="ALL">All</option>
                    <option value="TEST_DRIVE">Test Drive</option>
                    <option value="BOOKING">Booking</option>
                </select>
            </div>


            <table>
                <thead>
                    <tr>
                        <th>SL.NO</th>
                        <th>CUSTOMER NAME</th>
                        <th>CONTACT</th>
                        <th>ADDRESS</th>
                        <th>DRIVING LICENSE</th>
                        <th>SHOWROOM NAME</th>
                        <th>BIKE</th>
                        <th>SCHEDULE</th>
                        <th>RE-SCHEDULE Date</th>
                        <th>RE-SCHEDULE TIME</th>
                        <th>DESCRIPTION</th>
                        <th>UPDATE</th>
                        <th>VIEW UPDATES</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${details}" var="dts" varStatus="status">
                        <tr>
                            <td>${status.index +1}</td>
                            <td>${dts.customerName}</td>
                            <td>${dts.contactNo}</td>
                            <td>${dts.address}</td>
                            <td>${dts.drivingLicense}</td>
                            <td>${dts.showroomNames}</td>
                            <td>${dts.bikeNames}</td>
                            <td>${dts.schedule}</td>

                            <td>
                                <form action="updateReason" method="post">
                                    <input type="date" id="scheduledDate" name="scheduleDate" placeholder="Select Date"
                                        required />
                            </td>
                            <td>
                                <select id="scheduleTime" name="scheduleTime" required>
                                    <option value="" disabled selected>Select Time</option>
                                    <option value="10AM-11AM">10AM - 11AM</option>
                                    <option value="01PM-2PM">01PM - 02PM</option>
                                    <option value="4PM-5PM">4PM - 5PM</option>
                                </select>
                            </td>
                            <td>

                                <input type="hidden" name="customerName" value="${dts.customerName}" />
                                <textarea class="form-control description-input" name="reason"
                                    oninput="checkReason(this)" required>${dts.reason}</textarea>
                                <small class="description-reason"></small>
                            </td>
                            <td><input type="submit" value="UPDATE">
                                </form>
                            </td>
                            <td>
                                <a href="viewDetails?customerName=${dts.customerName}" class="view-button">VIEW
                                    UPDATES</a>
                            </td>


                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <script>
                function filterTable() {
                    const selectedValue = document.getElementById("filterSchedule").value;
                    const table = document.querySelector("table tbody");
                    const rows = table.querySelectorAll("tr");

                    rows.forEach(row => {
                        const scheduleCell = row.cells[7];
                        const scheduleValue = scheduleCell.textContent.trim();

                        if (selectedValue === "ALL" || scheduleValue === selectedValue) {
                            row.style.display = "";
                        } else {
                            row.style.display = "none";
                        }
                    });
                }

            </script>

            <script>
                function checkReason(textarea) {
                    const form = textarea.closest("form");
                    const button = form.querySelector('input[type="submit"]');
                    if (textarea.value.trim() === "") {
                        button.disabled = true;
                    } else {
                        button.disabled = false;
                    }
                }

                window.addEventListener("DOMContentLoaded", function () {
                    document.querySelectorAll("form").forEach(form => {
                        const textarea = form.querySelector("textarea[name='reason']");
                        const button = form.querySelector("input[type='submit']");
                        if (textarea && button) {
                            button.disabled = textarea.value.trim() === "";
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