<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="./base.jsp" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">



  <title>ESS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<style>





.section.dashboard {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
}
.total-time,
.total-leaves {
  margin-bottom: 10px;
  
}

.total-time .bi,
.total-leaves .bi {
  color: #4CAF50; /* Green color for clock icon */
}

.total-time-value,
.total-leaves-value {
  font-size: 24px;
  font-weight: bold;

}

.total-leaves-label {
  font-size: 18px;
  font-weight: bold;
}

    .punch-btn {
      display: block;
      width: 80%;
      padding: 8px;
      margin-bottom: 10px;
      border: none;
      margin-left:8px;
      cursor: pointer;
      font-size: 16px;
      text-align: center;
      color: #fff;
      border-radius:30px;
    }

    .punch-in-btn {
      background-color: green;
    }

    .punch-out-btn {
      background-color: red;
    }
    
</style>
</head>

<body>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="employee_dashboard" class="logo d-flex align-items-center">
        <img src="resources/assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">ESS</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

   
    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item dropdown">

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="resources/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">${currentUser.fullname}</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${currentUser.fullname}</h6>
              <span>${currentUser.position}</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="employee_profile">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>


            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="signout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="employee_dashboard">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

    
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Basic</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="employee_events">
              <i class="bi bi-circle"></i><span>Events</span>
            </a>
          </li>
          <li>
            <a href="employee_holidays">
              <i class="bi bi-circle"></i><span>Holiday Schedule</span>
            </a>
          </li>
         
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>Attendance</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="employee_attendance">
              <i class="bi bi-circle"></i><span>Daily attendance</span>
            </a>
          </li>
         
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>Leave Management</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="employee_leave">
              <i class="bi bi-circle"></i><span>Leave Application</span>
            </a>
          </li>
         
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="employee_profile">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

    
      <li class="nav-item">
        <a class="nav-link collapsed" href="employee_contact">
          <i class="bi bi-envelope"></i>
          <span>Contact</span>
        </a>
      </li><!-- End Contact Page Nav -->
     
   <br><br><br><br><br>
     <li class="nav-item">
        <a href="punchin" class="punch-btn punch-in-btn">Punch In</a>
      </li>

      <!-- Punch Out button -->
      <li class="nav-item">
        <a href="punchout" class="punch-btn punch-out-btn">Punch Out</a>
      </li>
     
     
    </ul>

  </aside><!-- End Sidebar-->

 <main id="main" class="main">
    
    <div class="pagetitle">
        <h1>Employee Dashboard</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="employee_dashboard">Home</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

 <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card " style="height: 265px;width:66%;margin-left:280px;">
                    <div class="card-body">
                        <h5 class="card-title text-center" style="margin-top: -8%;">Holidays Calender</h5>
                        <!-- Add your calendar component here -->
                        <!-- Example: -->
                        <div id="calendar">
                            <!-- Calendar content goes here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- End Calendar Section -->
    
    
<div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card " style="height: 265px;width:66%;margin-left:655px;margin-top:-63%;">
                    <div class="card-body">
                        <h5 class="card-title text-center" style="margin-top: -8%;">Events Calender</h5>
                        <!-- Add your calendar component here -->
                        <!-- Example: -->
                        <div id="calendar">
                            <!-- Calendar content goes here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- End Calendar Section -->



    <!-- Total Time and Total Leaves Section -->
    <div class="container">
        <div class="row">
        
          <div class="col-md-6">
   		 <div class="card" style="height: 120px;width:67%;margin-top: 18px;margin-left:280px;">
        <div class="card-body">
            <h5 class="card-title" style="font-size: 16px;">Total Time</h5>
            <div class="total-time" >
                <span class="total-time-value" style="font-size: 18px;">${totalTime}</span>
            </div>
        </div>
    </div>
</div>

<div class="col-md-6">
    <div class="card" style="height: 120px;width:66%;margin-top: 18px;margin-left:160px;">
        <div class="card-body">
            <h5 class="card-title" style="font-size: 16px;">Total Leaves Applied</h5>
            <div class="total-leaves" style="padding: 5px;">
                <span class="total-leaves-value" style="font-size: 18px;">${totalLeaves}</span>
            </div>
        </div>
    </div>
</div>


        </div>
    </div>
</main>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

</body>

</html>