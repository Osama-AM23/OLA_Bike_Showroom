<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Add Showroom</title>
            <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                type="image/png" />
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

            <style>
                :root {
                    --main-color: #5c899d;
                    --bg-color: #fffcef;
                    --text-color: #2e4a56;
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
                    height: 100vh;
                    flex-direction: column;
                }

                header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    background: var(--main-color);
                    padding: 8px 15px;
                    width: 100%;
                    position: fixed;
                    top: 0;
                    left: 0;
                }

                header img {
                    height: 35px;
                    width: auto;
                }

                .menu-icon {
                    font-size: 24px;
                    color: white;
                    cursor: pointer;
                    margin-left: auto;
                    margin-right: 40px;
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
                }

                .nav-menu a:hover {
                    background: #7dbdd8;
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

                .container {
                    background: var(--main-color);
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                    text-align: center;
                    width: 350px;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                }

                .container h3 {
                    color: white;
                    margin-bottom: 15px;
                    font-size: 18px;
                }

                .container input,
                .container select {
                    width: 100%;
                    padding: 12px;
                    margin: 10px 0;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                    background: white;
                    color: var(--text-color);
                    font-size: 16px;
                    outline: none;
                    box-sizing: border-box;
                    display: block;
                }

                .container input:focus,
                .container select:focus {
                    border-color: var(--main-color);
                    background: var(--bg-color);
                }

                .container input[type="submit"] {
                    background: var(--bg-color);
                    color: var(--text-color);
                    font-size: 16px;
                    font-weight: bold;
                    cursor: pointer;
                    transition: all 0.3s ease-in-out;
                    width: 100%;
                    box-shadow: 0 0 5px var(--bg-color);
                    border: none;
                }

                .container input[type="submit"]:hover {
                    box-shadow: 0 0 15px var(--bg-color);
                    transform: scale(1.05);
                }

                .error-msg {
                    color: red;
                    font-size: 12px;
                    font-weight: bold;
                    display: block;
                    margin-top: 2px;
                    text-align: left;
                    width: 100%;
                }
            </style>
        </head>

        <body>
            <header>
                <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                    alt="OLA Electric">
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

            <div class="container">
                <form action="${pageContext.request.contextPath}/addShowRoom" method="post">
                    <h3>ADD SHOWROOM BRANCH</h3>
                    <input type="text" id="showroomName" name="showroomName" placeholder="Enter Showroom Name"
                        onchange="onShowroom()" />
                    <span id="showroomError" class="error-msg"></span>

                    <input type="text" onchange="onAddress()" id="address" name="address"
                        placeholder="Enter Showroom Address" />
                    <span id="addressError" class="error-msg"></span>

                    <input type="text" onchange="onCity()" id="city" name="city" placeholder="Enter City">
                    <span id="cityError" class="error-msg"></span>

                    <input type="text" onchange="onContact()" id="contact" name="contact"
                        placeholder="Enter Showroom Contact" />
                    <span id="contactError" class="error-msg"></span>

                    <input type="submit" id="submitButton" value="Register Showroom">
                </form>
            </div>
            <script>

                function onShowroom() {
                    console.log('showroom Name form jsp');
                    var name = document.getElementById('showroomName');
                    var nameValue = name.value;
                    var showroomError = document.getElementById("showroomError");
                    var submitButton = document.getElementById("submitButton");

                    var pattern = /^[A-Za-z\s]{5,40}$/;

                    if (nameValue === "") {
                        showroomError.innerHTML = "Showroom Name cannot be empty!";
                        return;
                    }

                    if (!pattern.test(nameValue)) {
                        showroomError.innerHTML = "Invalid Showroom Name! Give Proper Showroom Name";
                        submitButton.disabled = true;
                        return;
                    }
                    showroomError.innerHTML = "";
                    submitButton.disabled = false;

                    var xhttp = new XMLHttpRequest();
                    if (nameValue !== "") {
                        xhttp.open("GET", "http://localhost:2004/Osama_Bike_Showroom/showroomName/" + nameValue + "?t=" + new Date().getTime(), true);
                        xhttp.send();

                        xhttp.onload = function () {
                            console.log(this.responseText)
                            document.getElementById("showroomError").innerHTML = this.responseText;

                            if (this.responseText.trim() !== "") {
                                submitButton.disabled = true;
                            } else {
                                submitButton.disabled = false;
                            }
                        }
                    }
                }

                function onAddress() {
                    console.log('Address from jsp');
                    var name = document.getElementById('address');
                    var nameValue = name.value;
                    var addressError = document.getElementById("addressError");
                    var submitButton = document.getElementById("submitButton");

                    var pattern = /^[A-Za-z0-9\s,.-]{5,40}$/;

                    if (nameValue === "") {
                        addressError.innerHTML = "Address cannot be empty!";
                        addressError.style.color = "red";
                        return;
                    }

                    if (!pattern.test(nameValue)) {
                        addressError.innerHTML = "Invalid Address! Give Proper Address";
                        addressError.style.color = "red";
                        submitButton.disabled = true;
                        return;
                    }

                    addressError.innerHTML = "";
                    submitButton.disabled = false;

                    var xhttp = new XMLHttpRequest();
                    if (nameValue !== "") {
                        xhttp.open("GET", "http://localhost:2004/Osama_Bike_Showroom/address/" + nameValue);
                        xhttp.send();

                        xhttp.onload = function () {
                            console.log(this.responseText)
                            document.getElementById("addressError").innerHTML = this.responseText;
                        }
                    }

                }

                function onCity() {
                    console.log('City from Jsp');
                    var name = document.getElementById('city');
                    var nameValue = name.value;
                    var cityError = document.getElementById("cityError");
                    var submitButton = document.getElementById("submitButton");

                    var pattern = /^[A-Za-z]{5,18}$/;

                    if (nameValue === "") {
                        cityError.innerHTML = "* City Required!";
                        submitButton.disabled = true;
                        return;
                    }

                    if (!pattern.test(nameValue)) {
                        cityError.innerHTML = "Give Proper City Name!";
                        submitButton.disabled = true;
                        return;
                    }
                    cityError.innerHTML = "";
                    submitButton.disabled = false;

                    var xhttp = new XMLHttpRequest();
                    if (nameValue !== "") {
                        xhttp.open("GET", "http://localhost:2004/Osama_Bike_Showroom/city/" + nameValue + "?t=" + new Date().getTime(), true);
                        xhttp.send();

                        xhttp.onload = function () {
                            console.log(this.responseText)
                            document.getElementById("cityError").innerHTML = this.responseText;

                            if (this.responseText.trim() !== "") {
                                submitButton.disabled = true;
                            } else {
                                submitButton.disabled = false;
                            }
                        }
                    }
                }

                function onContact() {
                    console.log('Contact form jsp');
                    var name = document.getElementById('contact');
                    var nameValue = name.value;
                    var contactError = document.getElementById("contactError");
                    var submitButton = document.getElementById("submitButton");

                    var pattern = /^[9876]\d{9}$/;

                    if (nameValue === "") {
                        contactError.innerHTML = "Contact number cannot be empty!";
                        contactError.style.color = "red";
                        return;
                    }

                    if (!pattern.test(nameValue)) {
                        contactError.innerHTML = "Invalid Contact! Give Proper Contact";
                        contactError.style.color = "red";
                        submitButton.disabled = true;
                        return;
                    }

                    contactError.innerHTML = "";
                    submitButton.disabled = false;

                    var xhttp = new XMLHttpRequest();
                    if (nameValue !== "") {
                        xhttp.open("GET", "http://localhost:2004/Osama_Bike_Showroom/contact/" + nameValue);
                        xhttp.send();

                        xhttp.onload = function () {
                            console.log(this.responseText)
                            document.getElementById("contactError").innerHTML = this.responseText;
                        }
                    }
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