<?php

@include 'config.php';

if(isset($_POST['submit'])){

   $name = mysqli_real_escape_string($conn, $_POST['full-name']);
   $email = mysqli_real_escape_string($conn, $_POST['email']);
   $phone = mysqli_real_escape_string($conn, $_POST['mobile']);
   $service = mysqli_real_escape_string($conn, $_POST['service']);
   $clinic = mysqli_real_escape_string($conn, $_POST['clinic']);
   $date = mysqli_real_escape_string($conn, $_POST['date']);
   $time = mysqli_real_escape_string($conn, $_POST['time']);
   $request = mysqli_real_escape_string($conn, $_POST['special-request']);
   

  

    $insert = "INSERT INTO booking(name, email, time, date, mobile, clinic, service, special_request) VALUES('$name','$email','$time','$date','$phone','$clinic','$service','$request')";
    mysqli_query($conn, $insert);
    header('location:newcalendar.html');
     
      
      
};


?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Axios -->
  <script src='https://unpkg.com/axios/dist/axios.min.js'></script>

  <!-- zz
    - primary meta tags
  -->
  <title>MediMate - health</title>
  <meta name="title" content="MediMate - home">
  <meta name="description" content="This is a madical html template made by codewithsadee">

  <!-- 
    - favicon
  -->
  <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">

  <!-- 
    - google font link
  -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;700&family=Rubik:wght@400;500;700&display=swap"
    rel="stylesheet">

  <!-- 
    - custom css link
  -->
  <link rel="stylesheet" href="./assets/css/style.css">

  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <!-- 
    - preload images
  -->
  <link rel="preload" as="image" href="./assets/images/hero-banner.png">
  <link rel="preload" as="image" href="./assets/images/hero-bg.png">
  <style>
    /* ================================================= */
    /* ----------------- Booking Style ----------------- */
    /* ================================================= */
    /* Increase spacing between elements in the booking form */
    /* Increase spacing between elements in the booking form */
    #booking .control-group {
      margin-bottom: 35px;
    }

    /* Increase spacing between the header and the form */
    #booking .section-header {
      margin-bottom: 40px;
    }






    #booking {
      position: relative;
      padding: 60px 0;
    }

    #booking .container {
      max-width: 900px;
    }

    #booking label {
      font-size: 14px;
      font-weight: 600;
    }

    #booking .booking-form input,
    #booking .booking-form select {
      font-size: 16px;
      padding: 10px 14px;
      border: 1px solid #ddd;
      border-radius: 20px;
      box-shadow: none;
      margin-bottom: 15px;
    }

    #booking .booking-form input:focus,
    #booking .booking-form textarea:focus {
      border: 1px solid #2aa1a5;
    }

    #booking .booking-form button[type="submit"] {
      background: #FFFFFF;
      border: none;
      padding: 8px 30px 10px 30px;
      color: #ffffff;
      background: #2aa1a5;
      transition: 0.4s;
      cursor: pointer;
      border-radius: 30px;
    }

    #booking .booking-form button[type="submit"]:hover {
      background: #54002a;
    }
  </style>
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">  -->
</head>

<body id="top">
<!-- 
    - #PRELOADER
  -->

  <div class="preloader" data-preloader>
    <div class="circle"></div>
  </div>
  
  <!-- 
    - #HEADER
  -->

  <header class="header" data-header>
    <div class="container">

      <a href="index.html" class="logo">
        <img src="./assets/images/medimatelogo2.png" width="100" height="46" alt="Medimate home">
      </a>

      <nav class="navbar" data-navbar>

        <div class="navbar-top">

          <a href="index.html" class="logo">
            <img src="./assets/images/medimatelogo2.png" width="136" height="46" alt="MediMate home">
          </a>

          <button class="nav-close-btn" aria-label="clsoe menu" data-nav-toggler>
            <ion-icon name="close-outline" aria-hidden="true"></ion-icon>
          </button>

        </div>

        <ul class="navbar-list">

          <li class="navbar-item">
            <a href="index.html" class="navbar-link title-md">Home</a>
          </li>

          <li class="navbar-item">
            <a href="searchclinic.html" class="navbar-link title-md">Search Clinic</a>
          </li>

          <li class="navbar-item">
            <a href="calendar.html" class="navbar-link title-md">Calendar</a>
          </li>

          <li class="navbar-item">
            <a href="payment.html" class="navbar-link title-md">Payment</a>
          </li>

          <li class="navbar-item">
            <a href="health.html" class="navbar-link title-md">My Health</a>
          </li>

        </ul>

        <ul class="social-list">

          <li>
            <a href="#" class="social-link">
              <ion-icon name="logo-twitter"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="social-link">
              <ion-icon name="logo-facebook"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="social-link">
              <ion-icon name="logo-pinterest"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="social-link">
              <ion-icon name="logo-instagram"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="social-link">
              <ion-icon name="logo-youtube"></ion-icon>
            </a>
          </li>

        </ul>

      </nav>

      <button class="nav-open-btn" aria-label="open menu" data-nav-toggler>
        <ion-icon name="menu-outline"></ion-icon>
      </button>

      <!-- <a href="#" class="btn has-before title-md">Make Appointment</a> -->

      <div class="overlay" data-nav-toggler data-overlay></div>
      <li class="navbar-item">
        <a href="profile.html" class="navbar-link title-md"><img height="55" width="55"
            src="./assets/images/profileicon.png"></a>
      </li>

    </div>
  </header>

  <body class="healthpage">



    <!-- Booking Section Start -->
    <section id="booking">
      <div class="container">
        <div class="section-header">
          <h3>Book Your Clinic Appointment</h3>
        </div>
        <div class="row">
          <div class="col-12">
          <form action="" method="post">
            <div class="booking-form">
              <form id="bookingForm">
                <div class="form-row">
                  <div class="control-group col-sm-6">
                    <label>Full Name</label>
                    <input type="text" name="full-name" class="form-control" placeholder="E.g. Jamie Tan" id="name" style="background-color: white;"
                      required="required" />
                  </div>
                  <div class="control-group col-sm-6">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" placeholder="E.g. email@example.com" id="email" style="background-color: white;"
                      required="required" />
                  </div>
                </div>
                <div class="form-row">
                  <div class="control-group col-sm-6">
                    <label>Mobile</label>
                    <input type="text" name="mobile" class="form-control" placeholder="8772 2367" required="required" id="mobile" style="background-color: white;" />
                  </div>
                  <div class="control-group col-sm-6">
                    <label>Select a Clinic</label><br>
                    <select name="clinic" class="custom-select" id="service">
                      <option value="Complete Healthcare International">Complete Healthcare International</option>
                      <option>GP Healthcare</option>
                      <option>DTAP Clinic @ Robertson GP</option>
                      <option>Cross Street Medical Clinic</option>
                      <option>Orchard Group Clinic</option>
                      <option>Tanglin Medical Clinic</option>
                      <option>Minmed Clinic (Juron East)</option>
                      <option>UNIHEALTH 24-HR CLINIC (JURONG EAST)</option>
                      <option>Summit Medical Clinic</option>
                      <option>NTUC Health Medicine Clinic</option>
                      <option>326 Avenue 3 Clinic</option>
                      <option>Affinity Medical Clinic</option>
                      <option>AcuMed Medical (Bedok)</option>
                      <option>Health Line Family Clinic and Surgery</option>
                      <option>Minmed Clinic (Bedok)</option>
                    </select>
                  </div>
                  <div class="control-group col-sm-6">
                    <label>Select a Service</label><br>
                    <select name="service" class="custom-select" id="service">
                      <option value="Consultation">Consultation</option>
                      <option>Health Checkup</option>
                      <option>Flu Shots</option>
                      <option>Blood Test</option>
                      <option>Physical Exams</option>
                      <option>Prevention</option>
                      <option>Family Planning</option>
                      <option>Home Visits</option>
                      <option>Insurance</option>
                    </select>
                  </div>
                </div>
                <div class="form-row">
                  <div class="control-group col-sm-6">
                    <label>Appointment Date</label>
                    <input style="background-color: white;" type="date" class="form-control" id="date" name="date"
                      placeholder="E.g. MM/DD/YYYY" required="required" />
                  </div>
                  <div class="control-group col-sm-6">
                    <label>Appointment Time</label>
                    <input style="background-color: white;" type="time" name="time" class="form-control" id="time"
                      placeholder="E.g. HH:MM AM" required="required" />
                  </div>
                </div>
                <div class="control-group">
                  <label>Special Request</label>
                  <input type="text" name="special-request" class="form-control"  id="specialRequest" style="background-color: white;"
                    placeholder="E.g. Patient has poor mobility, requires wheelchair." />
                </div>
                <button type="submit" name="submit" value="Book Now" class="form-btn" style='width: 100%; height:70px;'>Book Now
                </form>
                </div>
                </div>
                </div>
                </div>
  </form>
                </section>

                <a href="#top" class="back-top-btn" aria-label="back to top" data-back-top-btn>
      <ion-icon name="chevron-up"></ion-icon>
    </a>

    <!-- 
                        - custom js link
                      -->
    <script src="./assets/js/script.js"></script>

    <!-- 
                        - ionicon link
                      -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

  </body>

</html>


