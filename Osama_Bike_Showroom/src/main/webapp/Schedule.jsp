<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule</title>
    <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
        type="image/png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        :root {
            --main-color: #5c899d;
            --bg-color: #fffcef;
            --text-color: #2e4a56;
            --button-hover: #4a7388;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            animation: fadeIn 1.5s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        header {
            background: var(--main-color);
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header-btn {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .menu-icon {
            font-size: 1.9rem;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .menu-icon:hover {
            transform: rotate(90deg);
        }

        .email-text {
            font-size: 1rem;
            cursor: pointer;
        }

        .nav-menu {
            position: fixed;
            top: 0;
            right: -300px;
            width: 250px;
            height: 100%;
            background-color: var(--main-color);
            color: white;
            padding: 20px;
            transition: right 0.4s ease;
            box-shadow: -4px 0 10px rgba(0, 0, 0, 0.2);
        }

        .nav-menu.show-menu {
            right: 0;
        }

        .nav-menu a {
            display: block;
            margin: 20px 0;
            color: white;
            text-decoration: none;
            font-size: 1.5rem;
            position: relative;
            padding-left: 25px;
            opacity: 0;
            animation: popupLinks 0.6s forwards;
        }

        .nav-menu a:nth-child(2) {
            animation-delay: 0.1s;
        }

        .nav-menu a:nth-child(3) {
            animation-delay: 0.2s;
        }

        .nav-menu a:nth-child(4) {
            animation-delay: 0.3s;
        }

        @keyframes popupLinks {
            to {
                opacity: 1;
                transform: translateX(0);
            }

            from {
                opacity: 0;
                transform: translateX(30px);
            }
        }

        .close-btn {
            font-size: 2rem;
            cursor: pointer;
            margin-bottom: 20px;
            display: block;
            text-align: right;
        }

        .nav-menu a .material-symbols-outlined {
            font-size: 1.5rem;
            vertical-align: middle;
            margin-right: 8px;
            color: white;
        }

        .container {
            max-width: 720px;
            margin: 25px auto;
            padding: 2px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            animation: fadeIn 1s ease;
        }

        form h3 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--text-color);
        }

        .input-group {
            position: relative;
            margin-bottom: 25px;
        }

        .input-group i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--main-color);
            font-size: 1.1rem;
        }

        .input-group input {
            width: 100%;
            padding: 10px 10px 10px 35px;
            border: none;
            border-bottom: 2px solid #ccc;
            background: transparent;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            outline: none;
            border-bottom-color: var(--main-color);
        }

        .select-group {
            position: relative;
            margin-bottom: 25px;
        }

        .select-group select {
            width: 100%;
            padding: 10px 5px;
            border: none;
            border-bottom: 2px solid #ccc;
            background: transparent;
            color: var(--text-color);
            font-size: 1rem;
            appearance: none;
            /* Remove default arrow */
            -webkit-appearance: none;
            -moz-appearance: none;
            cursor: pointer;
            transition: border-color 0.3s;
        }

        .select-group select:focus {
            outline: none;
            border-bottom-color: var(--main-color);
        }

        .select-group::after {
            content: '\25BC';
            /* Down arrow */
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none;
            color: var(--main-color);
        }

        .inline-fields {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }


        .inline-fields>div {
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


        .update-btn {
            width: 100%;
            padding: 10px;
            background-color: var(--main-color);
            color: white;
            font-size: 1rem;
            font-weight: bold;
            border: none;
            border-radius: 25px;
            margin-top: 10px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .update-btn:hover {
            background-color: var(--text-color);
            color: var(--bg-color);
            transform: scale(1.01);
        }

        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            .input-group input {
                font-size: 0.95rem;
            }

            .update-btn {
                font-size: 1rem;
            }
        }
    </style>
</head>

<body>
    <header>
        <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg" alt="OLA Electric"
          height="30" />
        <div class="header-btn">
          <span class="email-text"><i class="bi bi-person-circle"></i> ${email}</span>
          <i class="bi bi-list menu-icon" onclick="toggleMenu()"></i>
        </div>
      </header>

      <nav class="nav-menu" id="navMenu">
        <span class="close-btn" onclick="toggleMenu()">&times;</span>
        <a href="profileUpdate?email=${email}"><i class="bi bi-person-fill-up"></i>  Update Profile</a>
        <a href="exploreBikes?email=${email}">
            <span class="material-symbols-outlined"></span> Explore Bikes
        </a>
        <a href="schedule?email=${email}"><i class="bi bi-hourglass"></i>  Schedule</a>
        <a href="userDashBoard?email=${email}"><i class="bi bi-house-fill"></i> Home</a>
      </nav>

    <div class="container">
        <form action="scheduleUpdate" method="post">
            <h3>Update Schedule</h3>
            <div class="input-group">
                <input type="text" id="email" name="email" placeholder="Enter Your Email" value="${sdul.email}"
                    readonly>
            </div>

            <div class="select-group">
                <select id="showroomSelect" name="showroomNames" required>
                    <option value="" disabled selected>Select Showroom</option>
                    <c:forEach var="display" items="${showrooms}">
                        <option value="${display.name}">${display.name}(${display.address})</option>
                    </c:forEach>
                </select>
            </div>

            <div class="select-group">
                <select id="bikeSelect" name="bikeNames" required>
                    <option value="" disabled selected>Select Bikes</option>
                </select>
            </div>

            <div class="select-group">
                <select name="schedule" id="schedule">
                    <option value="" disabled selected>Select Schedule</option>
                    <c:forEach items="${schedule}" var="schedule">
                        <option value="${schedule.name()}">${schedule.name()}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="select-group">
                <select name="scheduleDays" id="scheduleDays">
                    <option value="" disabled selected>Select Scheduled Day</option>
                    <c:forEach items="${scheduleDays}" var="scheduleDay">
                        <option value="${scheduleDay.name()}">${scheduleDay.name()}</option>
                    </c:forEach>
                </select>
            </div>

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

            <input type="submit" class="update-btn" id="submitBtn" value="UPDATE SCHEDULE">


        </form>
    </div>

    <script>
        function toggleMenu() {
            document.getElementById('navMenu').classList.toggle('show-menu');
        }
        window.onbeforeunload = () => {
            document.body.classList.remove('fadeIn');
        };
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

</body>

</html>