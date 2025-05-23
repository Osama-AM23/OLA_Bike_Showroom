<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User-Register</title>
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

                * {
                    box-sizing: border-box;
                }

                body {
                    margin: 0;
                    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                    background: var(--bg-color);
                    color: var(--text-color);
                    display: flex;
                    justify-content: center;
                    align-items: flex-start;
                    min-height: 100vh;
                    padding-top: 80px;
                    text-align: center;
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
                    z-index: 999;
                }

                header img {
                    height: 10px;
                    width: auto;
                }

                .menu-icon {
                    font-size: 24px;
                    color: white;
                    cursor: pointer;
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
                    justify-content: space-between;
                    z-index: 1000;
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


                .container {
                    width: 90%;
                    max-width: 880px;
                    background: #f2f7f9;
                    padding: 1px;
                    border-radius: 10px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                    margin-bottom: 35px;
                    box-sizing: border-box;
                }

                .container h3 {
                    margin-top: 0;
                }

                .container input[type="text"],
                .container select {
                    width: 100%;
                    padding: 10px 5px;
                    margin: 6px 0;
                    border: none;
                    border-bottom: 2px solid #ccc;
                    border-radius: 0;
                    font-size: 13px;
                    background: transparent;
                    color: var(--text-color);
                    transition: border-color 0.3s;
                    appearance: none;
                    -webkit-appearance: none;
                    -moz-appearance: none;
                }

                .container input[type="text"]::placeholder {
                    font-size: 12px;
                    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                    color: var(--main-color);
                }

                .container input[type="text"]:focus,
                .container select:focus {
                    outline: none;
                    border-bottom: 2px solid var(--main-color);
                }

                .container select option[disabled] {
                    font-size: 13px;
                    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                    color: var(--main-color);
                }

                .container select option {
                    background: var(--bg-color);
                    color: black;
                }

                .container input[type="submit"] {
                    background-color: var(--main-color);
                    color: white;
                    border: none;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    border-radius: 8px;
                    padding: 12px 20px;
                    font-size: 16px;
                    box-shadow: 0 0 0px rgba(92, 137, 157, 0);
                    transform: scale(1);
                    margin-top: 10px;
                }

                .container input[type="submit"]:hover {
                    background-color: #476b7c;
                    box-shadow: 0 0 15px rgba(92, 137, 157, 0.7);
                    transform: scale(1.05);
                }

                .inline-fields {
                    display: flex;
                    flex-direction: row;
                    gap: 10px;
                    margin: 10px 0;
                }

                .inline-fields > div {
                    display: flex;
                    flex-direction: column;
                }

                .error-msg {
                    color: red;
                    font-size: 11px;
                    font-weight: bold;
                    display: block;
                    margin-top: 2px;
                    text-align: left;
                    width: 100%;
                }

                .inline-fields {
                    display: flex;
                    gap: 15px;
                    margin-top: 10px;
                }


                .inline-fields > div {
                    flex: 1;
                }


                #scheduleDate,
                #scheduleTime {
                    padding: 10px 10px;
                    width: 100%;
                    border: 1px solid #5c899d;
                    border-radius: 6px;
                    background-color: #ffffff;
                    color: #2e4a56;
                    font-size: 13px;
                    outline: none;
                    transition: border-color 0.3s, box-shadow 0.3s;
                }

                /* Focus state for both fields */
                #scheduleDate:focus,
                #scheduleTime:focus {
                    border-color: #2e4a56;
                    box-shadow: 0 0 6px rgba(92, 137, 157, 0.4);
                }


                @media (max-width: 600px) {
                    .inline-fields {
                        flex-direction: column;
                    }

                    .container {
                        padding: 20px 15px;
                    }

                    .container input,
                    .container select {
                        font-size: 14px;
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
                        <a href="bikesInformation"><i class="bi bi-bicycle"></i>Bikes Information</a>
                        <a href="getDetails"><i class="bi bi-box-arrow-in-right"></i> Assign Bike to Showroom</a>
                        <a href="followUp"><i class="bi bi-person-lines-fill"></i>Follow Up</a>
                        <a href="AdminSuccess.jsp"><i class="bi bi-house-door-fill"></i> Home Page</a>
            </nav>
            <div class="container">
                <form action="register" method="post">
                    <H3>Enter Your Details</H3>
                    <input type="text" onchange="onName()" id="customerName" name="customerName"
                        value="${user.customerName}" placeholder="Enter your Name" required>
                    <span id="customerNameError" class="error-msg"></span>
                    <c:if test="${not empty nameError}">
                        <div style="color: red; font-size: 13px; margin-top: -10px; text-align: left;">
                            ${nameError}
                        </div>
                    </c:if>

                    <div class="inline-fields">
                        <div style="flex: 1;">
                            <input type="text" onchange="onAge()" id="age" name="age" value="${user.age}" placeholder="Enter Your Age" required>
                            <span id="ageError" class="error-msg"></span>
                            <c:if test="${not empty ageError}">
                                <div class="error-msg">${ageError}</div>
                            </c:if>
                        </div>
                        <div style="flex: 1;">
                            <input type="text" onchange="onContact()" id="contactNo" name="contactNo" value="${user.contactNo}" placeholder="Enter Your Contact number">
                            <span id="contactNoError" class="error-msg"></span>
                            <c:if test="${not empty contactError}">
                                <div class="error-msg">${contactError}</div>
                            </c:if>
                        </div>
                    </div>
                    <input type="text" onchange="onEmail()" id="email" name="email" value="${user.email}"
                        placeholder="Enter Your Email Id">
                    <span id="emailError" class="error-msg"></span>
                    <c:if test="${not empty emailError}">
                        <div style="color: red; font-size: 13px; margin-top: -10px; text-align: left;">
                            ${emailError}
                        </div>
                    </c:if>
                    <input type="text" onchange="onAddress()" id="address" name="address" value="${user.address}"
                        placeholder="Enter Your Address" required>
                        <span id="addressError" class="error-msg"></span>
                    <c:if test="${not empty addressError}">
                        <div style="color: red; font-size: 13px; margin-top: -10px; text-align: left;">
                            ${addressError}
                        </div>
                    </c:if>
                    <input type="text" onchange="onDrivingLicense()" id="drivingLicense" name="drivingLicense"
                        value="${user.drivingLicense}" placeholder="Enter Your Driving License Number" required>
                    <span id="drivingLicenseError" class="error-msg"></span>
                    <c:if test="${not empty licenseError}">
                        <div style="color: red; font-size: 13px; margin-top: -10px; text-align: left;">
                            ${licenseError}
                        </div>
                    </c:if>

                    <select id="showroomSelect" name="showroomNames" required>
                        <option value="" disabled selected>Select Showroom</option>
                        <c:forEach var="display" items="${showrooms}">
                            <option value="${display.name}">${display.name}(${display.address})</option>
                        </c:forEach>
                    </select>

                    <select id="bikeSelect" name="bikeNames" required>
                        <option value="" disabled selected>Select Bikes</option>
                    </select>

                    <select name="schedule" id="schedule">
                        <option value="" disabled selected>Select Schedule</option>
                        <c:forEach items="${schedule}" var="schedule">
                            <option value="${schedule.name()}">${schedule.name()}</option>
                        </c:forEach>
                    </select>

                   <!-- Schedule Dropdown -->
                   <select name="scheduleDays" id="scheduleDays">
                       <option value="" disabled selected>Select Scheduled Day</option>
                       <c:forEach items="${scheduleDays}" var="scheduleDay">
                           <option value="${scheduleDay.name()}">${scheduleDay.name()}</option>
                       </c:forEach>
                   </select>

                   <div id="scheduleDetails" style="display: none; margin-top: 10px;">
                       <!-- Inline Fields for Date and Time -->
                       <div class="inline-fields">
                           <!-- Date Field -->
                           <div>
                               <input type="date" id="scheduleDate" name="scheduleDate" placeholder="Select Date" required />
                           </div>

                           <!-- Time Field -->
                           <div>
                               <select id="scheduleTime" name="scheduleTime" required>
                                   <option value="" disabled selected>Select Time</option>
                                   <option value="10AM-11AM">10AM - 11AM</option>
                                   <option value="01PM-2PM">01PM - 02PM</option>
                                   <option value="4PM-5PM">4PM - 5PM</option>
                               </select>
                           </div>
                       </div>
                   </div>



                    <input type="submit" id="submitBtn" value="Submit"
                        style="padding: 8px 16px; border: 2px solid transparent; background-color: #5c899d; color: white; cursor: pointer;">
                </form>
            </div>

            <script>
                function toggleMenu() {
                    const menu = document.getElementById('navMenu');
                    menu.classList.toggle('show-menu');
                }
            </script>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const scheduleDays = document.getElementById('scheduleDays');
                    const scheduleDetails = document.getElementById('scheduleDetails');
                    const scheduledDate = document.getElementById('scheduleDate');

                    scheduleDays.addEventListener('change', function () {
                        const selectedValue = this.value;

                        if (selectedValue === 'SCHEDULE_TODAY') {
                            const today = new Date().toISOString().split('T')[0];
                            scheduledDate.value = today;
                            scheduledDate.readOnly = true;
                            scheduleDetails.style.display = 'block';
                        } else if (selectedValue === 'SCHEDULE_LATER') {
                            scheduledDate.value = '';
                            scheduledDate.readOnly = false;
                            scheduleDetails.style.display = 'block';
                        } else {
                            scheduleDetails.style.display = 'none';
                        }
                    });
                });
            </script>


            <script>
                $(document).ready(function () {
                    $('#showroomSelect').change(function () {
                        var selectedShowroom = $(this).val();
                        if (selectedShowroom) {
                            $.ajax({
                                url: 'http://localhost:2004/Osama_Bike_Showroom/getBikes',
                                method: 'GET',
                                data: { showroomName: selectedShowroom },
                                dataType: 'json',
                                success: function (data) {
                                    console.log("Received bikes: ", data);
                                    $('#bikeSelect').empty().append('<option value="" disabled selected>Select Bikes</option>');
                                    $.each(data, function (index, bike) {
                                        $('#bikeSelect').append('<option value="' + bike + '">' + bike + '</option>');
                                    });
                                },
                                error: function () {
                                    alert('Failed to load bikes for showroom: ' + selectedShowroom);
                                }
                            });
                        }
                    });
                });

            </script>

            <script>
                $(document).ready(function () {
                    $('#schedule').change(function () {
                        var selectedValue = $(this).val();
                        var $submitBtn = $('#submitBtn');

                        if (selectedValue === "BOOKING") {
                            $submitBtn.val("BOOKING");
                            $submitBtn.css({
                                "background-color": "transparent",
                                "color": "#5c899d",
                                "border": "2px solid #5c899d"
                            });
                        } else if (selectedValue === "TEST_DRIVE") {
                            $submitBtn.val("TEST DRIVE");
                            $submitBtn.css({
                                "background-color": "#5c899d",
                                "color": "white",
                                "border": "2px solid #fffcef"
                            });
                        }
                    });
                });
            </script>

            <script>
                function onName() {
                    console.log('Customer Name from Ajax');
                    var name = document.getElementById('customerName');
                    var nameValue = name.value;
                    var nameError = document.getElementById("customerNameError");
                    var submitButton = document.getElementById("submitBtn");

                    var pattern = /^[A-Za-z.\s]{4,30}$/;

                    if (nameValue === "") {
                        customerNameError.innerHTML = "Customer Name Cannot be Empty!";
                    }

                    if (!pattern.test(nameValue)) {
                        customerNameError.innerHTML = "Invalid Customer Name! Give Proper Name";
                        submitBtn.disabled = true;
                        return;
                    }
                    customerNameError.innerHTML = "";
                    submitBtn.disabled = false;

                    var xhttp = new XMLHttpRequest();
                    if (nameValue !== "") {
                        xhttp.open("GET", "http://localhost:2004/Osama_Bike_Showroom/customerName/" + nameValue);
                        xhttp.send();

                        xhttp.onload = function () {
                            console.log(this.responseText)
                            document.getElementById("customerNameError").innerHTML = this.responseText;

                            if (this.responseText.trim() !== "") {
                                submitBtn.disabled = true;
                            } else {
                                submitBtn.disabled = false;
                            }
                        }
                    }
                }

                function onAge() {
                    console.log('Age from Ajax');
                    var name = document.getElementById('age');
                    var nameValue = name.value;
                    var nameError = document.getElementById("ageError");
                    var submitButton = document.getElementById("submitBtn");

                    var pattern = /^(1[89]|[2-9][0-9])$/;

                    if (nameValue === "") {
                        ageError.innerHTML = "Age Cannot be Empty!";
                    }

                    if (!pattern.test(nameValue)) {
                        ageError.innerHTML = "Invalid Age! Age must be up to 18 &Contain only Numbers";
                        submitBtn.disabled = true;
                        return;
                    }
                    ageError.innerHTML = "";
                    submitBtn.disabled = false;

                }



                function onContact() {
                    console.log('Contact No from Ajax');
                    var name = document.getElementById('contactNo');
                    var nameValue = name.value;
                    var nameError = document.getElementById("contactNoError");
                    var submitButton = document.getElementById("submitBtn");

                    var pattern = /^[9876]\d{9}$/;

                    if (nameValue === "") {
                        contactNoError.innerHTML = "Contact Number Cannot be Empty!";
                    }

                    if (!pattern.test(nameValue)) {
                        contactNoError.innerHTML = "Invalid Contact Number! Give Proper Contact Number";
                        submitBtn.disabled = true;
                        return;
                    }
                    contactNoError.innerHTML = "";
                    submitBtn.disabled = false;

                    var xhttp = new XMLHttpRequest();
                    if (nameValue !== "") {
                        xhttp.open("GET", "http://localhost:2004/Osama_Bike_Showroom/contactNo/" + nameValue);
                        xhttp.send();

                        xhttp.onload = function () {
                            console.log(this.responseText)
                            document.getElementById("contactNoError").innerHTML = this.responseText;

                            if (this.responseText.trim() !== "") {
                                submitBtn.disabled = true;
                            } else {
                                submitBtn.disabled = false;
                            }
                        }
                    }
                }

                function onAddress() {
                    console.log('Address from Ajax');
                    var name = document.getElementById('address');
                    var nameValue = name.value;
                    var nameError = document.getElementById("addressError");
                    var submitButton = document.getElementById("submitBtn");

                    var pattern = /^[A-Za-z0-9,_. ]{6,100}$/;

                    if (nameValue === "") {
                        addressError.innerHTML = "*(Address Required)";
                    }

                    if (!pattern.test(nameValue)) {
                        addressError.innerHTML = "Invalid Address! Give Proper Address";
                        submitBtn.disabled = true;
                        return;
                    }
                    addressError.innerHTML = "";
                    submitBtn.disabled = false;
                }

                function onEmail() {
                    console.log('Email Id from Ajax');
                    var name = document.getElementById('email');
                    var nameValue = name.value;
                    var nameError = document.getElementById("emailError");
                    var submitButton = document.getElementById("submitBtn");

                    var pattern = /^[a-z0-9.]+@gmail\.com$/;

                    if (nameValue === "") {
                        emailError.innerHTML = "* Email Required";
                    }

                    if (!pattern.test(nameValue)) {
                        emailError.innerHTML = "Invalid Email Id! Give Proper Email Id";
                        submitBtn.disabled = true;
                        return;
                    }
                    emailError.innerHTML = "";
                    submitBtn.disabled = false;

                    var xhttp = new XMLHttpRequest();
                    if (nameValue !== "") {
                        xhttp.open("GET", "http://localhost:2004/Osama_Bike_Showroom/email/" + nameValue);
                        xhttp.send();

                        xhttp.onload = function () {
                            console.log(this.responseText)
                            document.getElementById("emailError").innerHTML = this.responseText;

                            if (this.responseText.trim() !== "") {
                                submitBtn.disabled = true;
                            } else {
                                submitBtn.disabled = false;
                            }
                        }
                    }
                }

                function onDrivingLicense() {
                    console.log('Driving License No from Ajax');
                    var name = document.getElementById('drivingLicense');
                    var nameValue = name.value;
                    var nameError = document.getElementById("drivingLicenseError");
                    var submitButton = document.getElementById("submitBtn");

                    var pattern = /^[A-Z0-9]{15}$/;

                    if (nameValue === "") {
                        drivingLicenseError.innerHTML = "* Driving License Required";
                    }

                    if (!pattern.test(nameValue)) {
                        drivingLicenseError.innerHTML = "Invalid Driving License! Give Driving License No";
                        submitBtn.disabled = true;
                        return;
                    }
                    drivingLicenseError.innerHTML = "";
                    submitBtn.disabled = false;

                    var xhttp = new XMLHttpRequest();
                    if (nameValue !== "") {
                        xhttp.open("GET", "http://localhost:2004/Osama_Bike_Showroom/drivingLicense/" + nameValue);
                        xhttp.send();

                        xhttp.onload = function () {
                            console.log(this.responseText)
                            document.getElementById("drivingLicenseError").innerHTML = this.responseText;

                            if (this.responseText.trim() !== "") {
                                submitBtn.disabled = true;
                            } else {
                                submitBtn.disabled = false;
                            }
                        }
                    }
                }
            </script>

        </body>

        </html>