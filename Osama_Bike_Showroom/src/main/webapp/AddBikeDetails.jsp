<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Add Bike</title>
            <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                type="image/png" />
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

            <style>
                :root {
                    --main-color: #5c899d;
                    --bg-color: #fffcef;
                    --text-color: #2e4a56;
                }

                body {
                    margin: 0;
                    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                    background: var(--bg-color);
                    color: var(--text-color);
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    padding: 20px;
                    overflow-y: auto;
                    min-height: 100vh;
                }

                header {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background: var(--main-color);
                    padding: 15px;
                    width: 100%;
                    position: fixed;
                    top: 0;
                    left: 0;
                    z-index: 1000;
                }

                header img {
                    height: 30px;
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

                .container {
                    margin-top: 120px;
                    background: white;
                    padding: 30px 25px;
                    border-radius: 15px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                    width: 100%;
                    max-width: 500px;
                    text-align: left;
                }

                .container h3 {
                    color: var(--text-color);
                    font-size: 24px;
                    margin-bottom: 25px;
                    text-align: center;
                }

                .container input,
                .container select {
                    width: 100%;
                    padding: 10px 5px;
                    margin-bottom: 20px;
                    font-size: 16px;
                    color: var(--text-color);
                    background-color: transparent;
                    border: none;
                    border-bottom: 2px solid var(--text-color);
                    outline: none;
                    transition: all 0.3s ease;
                }

                .container input:focus,
                .container select:focus {
                    border-bottom: 2px solid #66a6c2;
                    background-color: transparent;
                }

                .container input::placeholder,
                .container select::placeholder {
                    font-size: 11px;
                    color: #a49999;
                }

                .container input[type="submit"] {
                    background-color: var(--main-color);
                    color: white;
                    font-weight: bold;
                    font-size: 17px;
                    cursor: pointer;
                    border: none;
                    border-radius: 10px;
                    transition: 0.3s ease;
                    height: 50px;
                    margin-top: 10px;
                }

                .container input[type="submit"]:hover {
                    background-color: var(--text-color);
                }

                label {
                    font-size: 13px;
                    font-weight: bold;
                    color: var(--text-color);
                    margin-bottom: 5px;
                    display: block;
                }

                input[type="file"] {
                    width: 100%;
                    padding: 8px;
                    border-radius: 8px;
                    border: 1px solid #ccc;
                    font-size: 14px;
                    background: var(--bg-color);
                }

                input[type="file"]::file-selector-button {
                    background-color: var(--main-color);
                    color: white;
                    border: none;
                    padding: 6px 12px;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: 0.3s;
                }

                input[type="file"]::file-selector-button:hover {
                    background-color: var(--text-color);
                }

                .error-msg,
                #fileError,
                #priceError {
                    color: red;
                    font-size: 10px;
                    font-weight: bold;
                    margin-top: 0px;
                    margin-bottom: 10px;
                    display: block;
                }

                @media (max-width: 500px) {
                    .container {
                        width: 95%;
                        padding: 25px;
                    }

                    header img {
                        height: 35px;
                    }

                    .container h3 {
                        font-size: 20px;
                    }

                    .container input,
                    .container select {
                        height: 45px;
                        font-size: 15px;
                    }

                    .container input[type="submit"] {
                        height: 48px;
                    }

                    .menu-icon {
                        margin-right: 20px;
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
                <a href="addBikeDetails"><i class="bi bi-plus-circle-fill"></i> Add Bike Details</a>
                <a href="getDetails"><i class="bi bi-box-arrow-in-right"></i> Assign Bike to Showroom</a>
                <a href="bikesInformation"><i class="bi bi-bicycle"></i>Bikes Information</a>
                <a href="register"><i class="bi bi-person-plus-fill"></i> Registration</a>
                <a href="followUp"><i class="bi bi-person-lines-fill"></i>Follow Up</a>
                <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
            </nav>

            <div class="container">
                <form id="bikeForm" action="addBikeDetails" method="post" enctype="multipart/form-data"
                    onsubmit="return validateForm()">
                    <h3>ADD Bike Details</h3>
                    <input type="text" onchange="onBikeName()" id="bikeName" name="bikeName"
                        placeholder="Enter The Bike Name (Eg: OLA S1 PRO)">
                    <span id="bikeNameError" class="error-msg"></span>

                    <c:if test="${not empty nameError}">
                       <div style="color: red; font-size: 12px; margin-top: -10px; text-align: left;">
                           ${nameError}
                       </div>
                    </c:if>

                    <input type="text" onchange="onYear()" id="year" name="year"
                        placeholder="Enter The Model Of the Year(Eg:yyyy)">
                    <span id="yearError" class="error-msg"></span>

                    <c:if test="${not empty yearError}">
                         <div style="color: red; font-size: 12px; margin-top: -10px; text-align: left;">
                             ${yearError}
                        </div>
                    </c:if>

                    <input type="text" onchange="onBikeRange()" id="bikeRange" name="bikeRange"
                        placeholder="Enter the Bike Range(Eg: 80KM)">
                    <span id="bikeRangeError" class="error-msg"></span>

                    <c:if test="${not empty rangeError}">
                         <div style="color: red; font-size: 12px; margin-top: -10px; text-align: left;">
                             ${rangeError}
                        </div>
                    </c:if>

                    <input type="text" onchange="onMotorPower()" id="motorPower" name="motorPower"
                        placeholder="Enter The Motor Power(Eg: 2900)">
                    <span id="motorPowerError" class="error-msg"></span>

                    <c:if test="${not empty motorPowerError}">
                         <div style="color: red; font-size: 12px; margin-top: -10px; text-align: left;">
                             ${motorPowerError}
                        </div>
                    </c:if>

                    <input type="text" onchange="onPrice()" id="price" name="price" placeholder="Enter Bike Price" />
                    <span id="priceError" class="error-msg"></span>

                    <c:if test="${not empty priceError}">
                         <div style="color: red; font-size: 12px; margin-top: -10px; text-align: left;">
                             ${priceError}
                        </div>
                    </c:if>

                    <label>
                        (max 05 images)
                        <input type="file" name="files" id="imgProperty" accept=".jpg, .jpeg, .png" multiple
                            onchange="validateFiles(this)">
                    </label>
                    <p id="fileError"></p>
                    <input type="submit" id="submitBtn" value="Register Details">
                </form>
            </div>

            <script>
                function validateFiles(input) {
                    let fileCount = input.files.length;
                    let fileError = document.getElementById("fileError");

                    if (fileCount > 5) {
                        alert("You can only upload a maximum of 5 images.");
                        fileError.innerText = "Maximum 5 images allowed.";
                        input.value = "";
                        return;
                    }

                    if (fileCount === 0) {
                        fileError.innerText = "You must upload images";
                    } else {
                        fileError.innerText = "";
                    }
                }
            </script>

            <script>
                function validateForm(event) {
                    let fileInput = document.getElementById("imgProperty");
                    let fileError = document.getElementById("fileError");

                    let isValid = true;

                    if (fileInput.files.length === 0) {
                        fileError.innerText = "You must upload at least one image.";
                        isValid = false;
                    } else {
                        fileError.innerText = "";
                    }

                    if (!isValid) {
                        event.preventDefault();
                    }
                }

                document.addEventListener("DOMContentLoaded", function () {
                    document.getElementById("submitBtn").addEventListener("click", validateForm);
                });
            </script>



            <script>

                function onBikeName() {
                    let bikeName = document.getElementById('bikeName').value;
                    let bikeNameError = document.getElementById("bikeNameError");
                    let submitBtn = document.getElementById("submitBtn");

                    let pattern = /^[A-Za-z ]{4}[A-Za-z0-9+ ]{0,30}$/;

                    if (bikeName === "") {
                        bikeNameError.innerHTML = "*(Required)";
                        submitBtn.disabled = true;
                    } else if (!bikeName.match(pattern)) {
                        bikeNameError.innerHTML = "Bike name must start with 4 letters, and Numbers (max 35 characters)";
                        submitBtn.disabled = true;
                        return;
                    } else {
                        bikeNameError.innerHTML = "";
                        submitBtn.disabled = false;
                    }

                    var xhttp = new XMLHttpRequest();
                    if (bikeName !== "") {
                        xhttp.open("GET", "http://localhost:2004/Osama_Bike_Showroom/bikeName/" + bikeName);
                        xhttp.send();

                        xhttp.onload = function () {
                            console.log(this.responseText)
                            document.getElementById("bikeNameError").innerHTML = this.responseText;
                        }
                    }
                }

                function onYear() {
                    let year = document.getElementById('year').value;
                    let yearError = document.getElementById("yearError");
                    let submitBtn = document.getElementById("submitBtn");

                    let pattern = /^(19|20)\d{2}$/;

                    if (year === "") {
                        yearError.innerHTML = "*(Year Required)";
                        submitBtn.disabled = true;
                    } else if (!year.match(pattern)) {
                        yearError.innerHTML = "Give Proper Year!"
                        submitBtn.disabled = true;
                    } else {
                        yearError.innerHTML = "";
                        submitBtn.disabled = false;
                    }

                }

                function onBikeRange() {
                    let bikeRange = document.getElementById('bikeRange').value;
                    let bikeRangeError = document.getElementById("bikeRangeError");
                    let submitBtn = document.getElementById("submitBtn");

                    let pattern = /^(7[6-9]|[89][0-9]|1[0-9]{2}|20[0-9])\s?KM$/;

                    if (bikeRange === "") {
                        bikeRangeError.innerHTML = "*(Required)";
                        submitBtn.disabled = true;
                    } else if (!bikeRange.match(pattern)) {
                        bikeRangeError.innerHTML = "Give Proper Range!";
                        submitBtn.disabled = true;
                    } else {
                        bikeRangeError.innerHTML = "";
                        submitBtn.disabled = false;
                    }
                }

                function onMotorPower() {
                    let motorPower = document.getElementById('motorPower').value;
                    let motorPowerError = document.getElementById("motorPowerError");
                    let submitBtn = document.getElementById("submitBtn");

                    let pattern = /^[A-Za-z0-9]{4}$/;
                    let num = parseInt(value);

                    if (motorPower === "") {
                        motorPowerError.innerHTML = "*(Required)";
                        submitBtn.disabled = true;
                    } else if (!motorPower.match(pattern)) {
                        motorPowerError.innerHTML = "Give Proper Motor Power!";
                        submitBtn.disabled = true;
                    } else if (num < 2900 || num > 9299){
                        motorPowerError.innerHTML = "Number must be between 2900 and 9299!";
                        submitBtn.disabled = true;
                    } else {
                        motorPowerError.innerHTML = "";
                        submitBtn.disabled = false;
                    }
                }

                function onPrice() {
                    let price = document.getElementById('price').value;
                    let priceError = document.getElementById("priceError");
                    let submitBtn = document.getElementById("submitBtn");

                    let pattern = /^[0-9]+$/;
                    if (!price.match(pattern) || price < 50000 || price > 400000) {
                        priceError.innerHTML = "Price must be between 50,000 and 400,000!";
                        submitBtn.disabled = true;
                        return;
                    }

                    priceError.innerHTML = "";
                    submitBtn.disabled = false;
                }
            </script>

            <script>
                function toggleMenu() {
                    const menu = document.getElementById('navMenu');
                    menu.classList.toggle('show-menu');
                }
            </script>
</body>

</html>