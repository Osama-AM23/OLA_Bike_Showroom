<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Main Page</title>
  <link rel="icon"
    href="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg" type="image/png" />
  <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

  <style>
    :root {
      --main-color: #5c899d;
      --bg-color: #fffcef;
      --text-color: #2e4a56;
      --button-hover: #4a7388;
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
      height: 100vh;
      display: flex;
      flex-direction: column;
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: var(--main-color);
      padding: 8px 20px;
      width: 100%;
      position: fixed;
      top: 0;
      left: 0;
      z-index: 1000;
    }

    .header-btn {
      position: relative;
      font-size: 16px;
      font-weight: 500;
      color: white;
      text-decoration: none;
      background: none;
      border: none;
      cursor: pointer;
      padding: 8px 12px;
      transition: color 0.3s ease;
      display: flex;
      align-items: center;
      gap: 8px; /* space between icon and text */
    }

    .header-btn i {
      font-size: 18px;
    }

    .header-btn::before,
    .header-btn::after {
      content: "";
      position: absolute;
      left: 0;
      right: 0;
      height: 2px;
      background-color: white;
      transform: scaleX(0);
      transition: transform 0.3s ease;
    }

    .header-btn::before {
      top: 0;
      transform-origin: left;
    }

    .header-btn::after {
      bottom: 0;
      transform-origin: right;
    }

    .header-btn:hover::before,
    .header-btn:hover::after {
      transform: scaleX(1);
    }

    .header-btn:hover {
      color: #fff9e0;
    }



    .main-content {
      display: flex;
      flex-wrap: wrap;
      margin-top: 100px;
      padding: 20px;
      justify-content: space-between;
      gap: 20px;
      flex: 1;
    }

    .card-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      flex: 1;
      padding-right: 20px;
    }

    .card {
      background: #f8fafa;
      border-radius: 15px;
      padding: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      min-height: 130px;
    }

    .card:hover {
      transform: translateY(-6px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
    }

    .card-title {
      font-size: 20px;
      font-weight: 600;
      margin-bottom: 15px;
      text-align: center;
    }

    .btn-link {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      padding: 10px 12px;
      background: var(--button-hover);
      color: white;
      font-weight: bold;
      font-size: 15px;
      border-radius: 50px;
      text-decoration: none;
      transition: all 0.3s ease-in-out;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      align-self: center;
    }

    .btn-link i {
      margin-right: 8px;
      font-size: 15px;
    }

    .btn-link:hover {
      background: var(--main-color);
      color: var(--bg-color);
      box-shadow: 0 0 20px var(--button-hover);
    }

    .btn-link:hover i {
      animation: bounce 0.4s ease-in-out;
    }

    @keyframes bounce {
      0%, 100% {
        transform: translateY(0);
      }

      50% {
        transform: translateY(-5px);
      }
    }

    .right-img {
      flex: 1;
      display: flex;
      justify-content: flex-end;
      align-items: flex-end;
    }

    .right-img img {
      max-width: 100%;
      width: 500px;
      object-fit: contain;
    }

    @media screen and (max-width: 992px) {
      .main-content {
        flex-direction: column;
        align-items: center;
      }

      .right-img {
        justify-content: center;
        margin-top: 30px;
      }

      .right-img img {
        width: 80%;
      }
    }
  </style>
</head>

<body>
  <header>
    <img src="https://cdn.olaelectric.com/ev-discovery-platform/New-Homepage/ola_black_logo.svg" alt="OLA Electric" />
    <a href="index.jsp" class="header-btn">
        <i class="bi bi-house-fill"></i>Home
      </a>
  </header>

  <div class="main-content">
    <div class="card-container">
      <div class="card">
        <div class="card-title">Add a New Branch</div>
        <a href="addShowRoom" class="btn-link">
          <i class="bi bi-plus-circle-fill"></i> Add Showroom
        </a>
      </div>

      <div class="card">
        <div class="card-title">Add Bike Details</div>
        <a href="addBikeDetails" class="btn-link">
          <i class="bi bi-plus-circle-fill"></i> Add Bike Details
        </a>
      </div>

      <div class="card">
        <div class="card-title">Bikes Information</div>
        <a href="bikesInformation" class="btn-link">
          <i class="bi bi-bicycle"></i>  Bikes Information
        </a>
      </div>

      <div class="card">
        <div class="card-title">Registration</div>
        <a href="register" class="btn-link">
          <i class="bi bi-person-plus-fill"></i> Register
        </a>
      </div>

      <div class="card">
        <div class="card-title">Follow Up</div>
        <a href="followUp" class="btn-link">
          <i class="bi bi-person-lines-fill"></i> Follow Up
        </a>
      </div>

      <div class="card">
        <div class="card-title">Assign Bike to Showroom</div>
        <a href="getDetails" class="btn-link">
          <i class="bi bi-box-arrow-in-right"></i> Assign Bike
        </a>
      </div>

      <!-- Add more cards as needed -->
    </div>

    <div class="right-img">
      <img src="https://i.ibb.co/TMf6Mkrh/home-experience-center-bg-v2-Photoroom.png" alt="Experience Center" />
    </div>
  </div>
</body>
<script>
    // Clear timer after successful login
    localStorage.removeItem("otpEndTime");
</script>

</html>
