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
</head>

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

    .container {
      padding: 40px 20px;
      max-width: 1200px;
      margin: auto;
    }

    .container h2 {
      text-align: center;
      font-size: 25px;
      color: #2e4a56;
      margin-bottom: 30px;
    }

    .card {
      background: #f8fafa;
      border-radius: 15px;
      padding: 20px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .card:hover {
      transform: translateY(-6px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
    }

    .card img {
      width: 100%;
      max-width: 280px;
      height: auto;
      border-radius: 10px;
      margin-bottom: 15px;
      object-fit: cover;
    }

    .card h4 {
      margin: 5px 0;
      font-size: 14px;
      color: #333;
      text-align: center;
    }

    .container .card-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 25px;
    }

</style>

<body>

    <header>
        <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg" alt="OLA Electric">
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

   <div class="container">
       <h2>SHOWROOM DETAILS</h2>

       <div class="card-grid">
           <c:forEach items="${display}" var="display">
               <div class="card">
                <img src="${pageContext.request.contextPath}/display?imgPath=${display.imgPath}" />
                   <h4>SHOWROOM : ${display.showroomName}</h4>
                   <h4>ADDRESS : ${display.address}</h4>
                   <h4>CITY : ${display.city}</h4>
                   <h4>CONTACT : ${display.contact}</h4>
               </div>
           </c:forEach>
       </div>
   </div>



    <script>
        function toggleMenu() {
            const menu = document.getElementById('navMenu');
            menu.classList.toggle('show-menu');
        }
    </script>
</body>

</html>