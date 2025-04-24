<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User_DashBoard</title>
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

    .nav-menu a:nth-child(2) { animation-delay: 0.1s; }
    .nav-menu a:nth-child(3) { animation-delay: 0.2s; }
    .nav-menu a:nth-child(4) { animation-delay: 0.3s; }

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

    main {
      padding: 40px 20px;
      text-align: center;
    }

    h1 {
      margin-bottom: 40px;
      font-size: 5rem;
      cursor: pointer;
    }

    .card-container {
      display: flex;
      gap: 20px;
      justify-content: center;
      flex-wrap: wrap;
    }

    .card, .video-card {
      background-color: white;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      width: 300px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      cursor: pointer;
    }

    .card:hover, .video-card:hover {
      transform: scale(1.05);
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
    }

    .card img, .video-card video {
      width: 100%;
      display: block;
    }

    .card-content, .video-card-content {
      padding: 15px;
    }

    .video-card-section {
      display: flex;
      justify-content: center;
      margin-top: 40px;
    }

    footer {
      background-color: var(--main-color);
      color: white;
      text-align: center;
      padding: 10px;
      font-size: 0.9rem;
      position: relative;
      bottom: 0;
      width: 100%;
    }

    @media (max-width: 768px) {
      .card-container {
        flex-direction: column;
        align-items: center;
      }

      .video-card {
        width: 90%;
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
    <a href="${pageContext.request.contextPath}/exploreBikes?email=${email}">
        <span class="material-symbols-outlined"></span> Explore Bikes
    </a>
    <a href="schedule?email=${email}"><i class="bi bi-hourglass"></i>  Schedule</a>
  </nav>

  <main>
    <h1>Welcome To Our OLA Electric</h1>
    <div class="card-container">
      <div class="card">
        <img
          src="https://cdn.olaelectric.com/sites/evdp/pages/bike/motorcycle_page_banner_web_image.webp"
          alt="Bike 1">
        <div class="card-content">
          <p>Electric Bike Roadster</p>
        </div>
      </div>

      <div class="card">
        <img
          src="https://cdn.olaelectric.com/sites/evdp/pages/gig/home_banner_gig_web_image_v2.webp"
          alt="Bike 3">
        <div class="card-content">
          <p>Riding Towards | Gig</p>
        </div>
      </div>
    </div>
  </main>

  <div class="video-card-section">
    <div class="video-card">
      <video autoplay muted loop playsinline>
        <source src="https://cdn.olaelectric.com/sites/evdp/pages/bike/roadster/roadtser_web_video.mp4"
          type="video/mp4">
        Your browser does not support the video tag.
      </video>
      <div class="video-card-content">
        <p>Roadster Electric Experience</p>
      </div>
    </div>
  </div>

  <footer>
    &copy; 2025 Bike Showroom. All rights reserved.
  </footer>

  <script>
    function toggleMenu() {
      document.getElementById('navMenu').classList.toggle('show-menu');
    }

    // Reapply fade in on refresh
    window.onbeforeunload = () => {
      document.body.classList.remove('fadeIn');
    };
  </script>
</body>

</html>
