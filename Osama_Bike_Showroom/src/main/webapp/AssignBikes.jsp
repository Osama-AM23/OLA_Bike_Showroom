<%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Assign Bikes</title>
            <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                type="image/png" />
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
            <style>
                :root {
                    --main-color: #5c899d;
                    --bg-color: #fffcef;
                    --text-color: #2e4a56;
                    --accent-color: #4c7484;
                    --container-bg: #ffffff;
                    --h2-bg: #5c899d;
                    --h2-text: white;
                    --success-color: #28a745;
                }

                body {
                    margin: 0;
                    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                    background: var(--bg-color);
                    color: var(--text-color);
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    flex-direction: column;
                }

                header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    background: var(--main-color);
                    padding: 10px 20px;
                    width: 100%;
                    position: fixed;
                    top: 0;
                    left: 0;
                    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
                }

                header img {
                    height: 35px;
                    width: auto;
                }

                .container {
                    position: relative;
                    width: 100%;
                    max-width: 500px;
                    background: var(--container-bg);
                    padding: 25px;
                    border-radius: 10px;
                    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
                    text-align: center;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    margin-top: 100px;
                    border: 2px solid var(--main-color);
                }

                .bottom-right-image {
                    position: absolute;
                    bottom: 10px;
                    right: 1px;
                    width: 195px;
                    height: auto;
                    opacity: 0.8;
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

                .email-text {
                    font-size: 12px;
                    color: var(--table-hover);
                	transition: color 0.3s, text-decoration 0.3s;
                	margin-left: 1000px;
                }

                .email-text:hover {
                	color: var(--bg-color);
                	text-decoration: underline;
                }

                h2 {
                    background: var(--h2-bg);
                    color: var(--h2-text);
                    padding: 12px;
                    border-radius: 8px;
                    width: 100%;
                }

                .bike-checkbox {
                    position: absolute;
                    opacity: 0;
                    width: 0;
                    height: 0;
                }

                .bike-label {
                    display: flex;
                    align-items: center;
                    padding: 10px;
                    border-radius: 6px;
                    border: 1px solid var(--main-color);
                    width: 100%;
                    background: #f9f9f9;
                    cursor: pointer;
                    transition: background 0.3s ease, transform 0.2s ease;
                    position: relative;
                }

                .bike-label i {
                    display: none;
                    color: var(--success-color);
                    font-size: 20px;
                    margin-left: auto;
                }

                .bike-checkbox:checked + .bike-label {
                    background: var(--bg-color);
                    color: black;
                    transform: scale(1.0);
                }

                .bike-checkbox:checked + .bike-label i {
                    display: inline-block;
                }


                button {
                    padding: 10px 18px;
                    background: var(--main-color);
                    color: white;
                    border: none;
                    border-radius: 6px;
                    cursor: pointer;
                    margin-top: 15px;
                    font-size: 16px;
                    transition: all 0.3s ease-in-out;
                    width: 100%;
                }

                button:hover {
                    background: var(--accent-color);
                    transform: scale(1.05);
                }
                @media (max-width: 500px) {
                    .container {
                        width: 90%;
                        max-width: 320px;
                        padding: 18px;
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
                <span class="close-btn" onclick="toggleMenu()">&times;</span>
                <a href="addShowRoom"><i class="bi bi-plus-circle-fill"></i> Add Showroom</a>
                <a href="bikesInformation"><i class="bi bi-bicycle"></i>Bikes Information</a>
                <a href="addBikeDetails"><i class="bi bi-plus-circle-fill"></i> Add Bike Details</a>
                <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>

            </nav>


            <div class="container">
                <h2>Assign Bikes to Showroom</h2>
                <img src="https://i.ibb.co/TMf6Mkrh/home-experience-center-bg-v2-Photoroom.png" alt="Bike Image" class="bottom-right-image">
                <form action="assignBikes" method="post">
                    <label><strong>Showroom Name: ${showroom.showroomName}</strong></label><br>
                    <label><strong>Address: ${showroom.address}</strong></label><br><br>

                    <input type="hidden" name="address" value="${showroom.address}">
                    <c:if test="${not empty error}">
                        <div class="error-message">${error}</div>
                    </c:if>

                    <label>Select Bikes (Max 5):</label>
                    <div class="checkbox-container">
                        <c:forEach items="${bikeName}" var="bike">
                            <input type="checkbox" name="bikeNames" value="${bike}" class="bike-checkbox"
                                id="bike-${bike}">
                            <label for="bike-${bike}" class="bike-label">
                                ${bike} <i class="bi bi-check-circle icon"></i>
                            </label><br>
                        </c:forEach>
                    </div>
                    <br>
                    <div id="error-message" style="color: red; font-weight: bold; margin-top: 10px;"></div>
                    <br>

                    <button type="submit" id="submit-btn" disabled>Assign Bikes</button>
                </form>

                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        const checkboxes = document.querySelectorAll(".bike-checkbox");
                        const submitButton = document.getElementById("submit-btn");
                        const errorMessage = document.getElementById("error-message");

                        function updateSelection() {
                            let checkedCount = 0;

                            checkboxes.forEach(checkbox => {
                                const icon = checkbox.nextElementSibling.querySelector(".icon");
                                if (checkbox.checked) {
                                    checkedCount++;
                                    icon.style.display = "inline-block";
                                } else {
                                    icon.style.display = "none";
                                }
                            });

                            // Disable button based on conditions, but don't show error yet
                            if (checkedCount > 5 || checkedCount === 0) {
                                submitButton.disabled = true;
                            } else {
                                submitButton.disabled = false;
                            }


                            errorMessage.style.display = "none";
                            errorMessage.innerHTML = "";
                        }

                        checkboxes.forEach(checkbox => {
                            checkbox.addEventListener("change", updateSelection);
                        });

                        submitButton.addEventListener("click", function (event) {
                            let checkedCount = document.querySelectorAll(".bike-checkbox:checked").length;

                            if (checkedCount > 5) {
                                event.preventDefault();
                                errorMessage.innerHTML = "You can select a maximum of 5 bikes!";
                                errorMessage.style.display = "block";
                            } else if (checkedCount === 0) {
                                event.preventDefault();
                                errorMessage.innerHTML = "First, assign the bikes!";
                                errorMessage.style.display = "block";
                            }
                        });
                    });

                </script>

                <script>
                    function toggleMenu() {
                        const menu = document.getElementById('navMenu');
                        menu.classList.toggle('show-menu');
                    }
                </script>
            </div>
</body>

</html>