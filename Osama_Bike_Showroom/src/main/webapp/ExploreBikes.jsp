<%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Explore_bikes</title>
                <link rel="icon"
                    href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg"
                    type="image/png" />
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


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
                        max-width: 1200px;
                        margin: 40px auto;
                        padding: 0 20px;
                    }

                    .container h2 {
                        text-align: center;
                        margin-bottom: 30px;
                        font-size: 2rem;
                        color: var(--main-color);
                    }

                    .card-grid {
                        display: grid;
                        gap: 30px;
                    }

                    .card {
                        display: flex;
                        flex-direction: row;
                        background-color: white;
                        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                        border-radius: 16px;
                        overflow: hidden;
                        transition: transform 0.3s ease;
                    }

                    .card:hover {
                        transform: translateY(-5px);
                    }

                    .card img {
                        width: 250px;
                        height: auto;
                        object-fit: cover;
                    }

                    .card-details {
                        padding: 20px;
                        flex: 1;
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                        gap: 10px;
                    }

                    .card-details h4 {
                        margin: 0;
                        font-size: 1.1rem;
                    }

                    .card-details a {
                        display: inline-block;
                        margin-top: 15px;
                        padding: 10px 20px;
                        background-color: var(--main-color);
                        color: white;
                        text-decoration: none;
                        border-radius: 8px;
                        transition: background-color 0.3s ease, transform 0.2s ease;
                        width: fit-content;
                    }

                    .card-details a:hover {
                        background-color: var(--button-hover);
                        transform: scale(1.05);
                    }

                    /* Responsive design */
                    @media (max-width: 768px) {
                        .card {
                            flex-direction: column;
                            align-items: center;
                        }

                        .card img {
                            width: 100%;
                            height: auto;
                        }

                        .card-details {
                            align-items: center;
                            text-align: center;
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
                    <h2>EXPLORE BIKES WITH SHOWROOM</h2>

                    <div class="card-grid">
                        <c:forEach items="${info}" var="show">
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/showroomDisplay?imgPath=${show.imgPath}"
                                    alt="Showroom Image" />
                                <div class="card-details">
                                    <h4>SHOWROOM: ${show.showroomName}</h4>
                                    <h4>ADDRESS: ${show.address}</h4>
                                    <h4>CITY: ${show.city}</h4>
                                    <h4>CONTACT: ${show.contact}</h4>
                                    <a href="showroomBikes?address=${show.address}&email=${email}">Explore Bikes</a>
                                </div>
                            </div>

                        </c:forEach>
                    </div>
                </div>

                <script>
                    function toggleMenu() {
                        document.getElementById('navMenu').classList.toggle('show-menu');
                    }
                    window.onbeforeunload = () => {
                        document.body.classList.remove('fadeIn');
                    };
                </script>

            </body>

            </html>