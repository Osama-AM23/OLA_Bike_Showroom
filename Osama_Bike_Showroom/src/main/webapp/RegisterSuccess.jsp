<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register Success</title>
  <link rel="icon" href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg" type="image/png" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
  <style>
    :root {
      --main-color: #5c899d;
      --bg-color: #fffcef;
      --text-color: #2e4a56;
      --highlight-color: #add7e9;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
      background-color: var(--bg-color);
      color: var(--text-color);
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 100px;
      overflow-x: hidden;
    }

    header {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      background-color: var(--main-color);
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 25px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
      animation: slideDown 0.5s ease-out forwards;
      z-index: 1000;
    }

    header img {
      height: 40px;
    }

    .menu-icon {
      font-size: 28px;
      color: white;
      cursor: pointer;
      transition: transform 0.3s ease;
    }

    .menu-icon:hover {
      color: var(--highlight-color);
      transform: scale(1.2);
    }

    .nav-menu {
      position: fixed;
      top: 0;
      right: -300px;
      height: 100vh;
      width: 260px;
      background: var(--main-color);
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 70px;
      transition: right 0.4s ease-in-out;
      z-index: 999;
    }

    .nav-menu a {
      color: white;
      text-decoration: none;
      font-size: 18px;
      margin: 15px 0;
      padding: 12px;
      width: 100%;
      text-align: center;
      transition: background 0.3s, transform 0.3s;
    }

    .nav-menu a:hover {
      background-color: var(--highlight-color);
      color: var(--text-color);
      transform: translateX(8px);
    }

    .close-btn {
      position: absolute;
      top: 20px;
      right: 20px;
      font-size: 28px;
      color: white;
      cursor: pointer;
    }

    .show-menu {
      right: 0;
    }

    .container {
      text-align: center;
      animation: fadeInUp 1s ease;
    }

    .container img {
      max-width: 300px;
      width: 90%;
      animation: float 3s ease-in-out infinite;
    }

    h2 {
      margin-top: 20px;
      font-size: 28px;
      color: var(--main-color);
      animation: fadeIn 1.5s ease-in forwards;
      opacity: 0;
    }

    @keyframes slideDown {
      from {
        top: -60px;
        opacity: 0;
      }
      to {
        top: 0;
        opacity: 1;
      }
    }

    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes fadeIn {
      to {
        opacity: 1;
      }
    }

    @keyframes float {
      0%, 100% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(-10px);
      }
    }
  </style>
</head>
<body>
  <header>
    <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg" alt="OLA Electric" />
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

  <div class="container">
    <img src="https://i.ibb.co/0p67NTRn/undraw-join-6quk-Photoroom.png" alt="Success Image" />
    <h2>Registration Successful!</h2>
  </div>

  <script>
    function toggleMenu() {
      document.getElementById('navMenu').classList.toggle('show-menu');
    }
  </script>
</body>
</html>
