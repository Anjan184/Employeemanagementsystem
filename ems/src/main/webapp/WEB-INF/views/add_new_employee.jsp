<%@page import="ems.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="./base.jsp" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ESS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <title>Employee Registration</title>
  <style>
  
     .container {
            max-width: 500px;
            margin-top: 50px;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .container h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 5px;
        }

.btn-primary {
    border-radius: 20px;
    width: 50%;
    margin: 0 auto; /* Center horizontally */
    display: flex; /* Use flexbox */
    justify-content: center; /* Center horizontally */
}

    body {
   
    
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 500px;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    select {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }

    select {
      height: 40px;
    }

    button {
      background-color: #4caf50;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }

    button:hover {
      background-color: #45a049;
    }
  </style>
</head>


<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index" class="logo d-flex align-items-center">
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
           <img src="data:profilePicture/jpeg;base64,<%=session.getAttribute("img")%>"  width="40" height="50" alt="Profile" class="rounded-circle">
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
              <a class="dropdown-item d-flex align-items-center" href="users-profile">
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
        <a class="nav-link " href="index">
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
            <a href="Events">
              <i class="bi bi-circle"></i><span>Events</span>
            </a>
          </li>
          <li>
            <a href="Holidays">
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
            <a href="Attendance_correction">
              <i class="bi bi-circle"></i><span>Attendance</span>
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
            <a href="Leave_application">
              <i class="bi bi-circle"></i><span>Leave Application</span>
            </a>
          </li>   
          
           <li>
            <a href="approved_application">
              <i class="bi bi-circle"></i><span>Approved Application</span>
            </a>
          </li>
          
           <li>
            <a href="rejected_application">
              <i class="bi bi-circle"></i><span>Rejected Application</span>
            </a>
          </li>
          
        </ul>
 

      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

    
      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-contact">
          <i class="bi bi-envelope"></i>
          <span>Contact</span>
        </a>
      </li><!-- End Contact Page Nav -->
     
    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Admin Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index">Home</a></li>
          <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
           <li class="breadcrumb-item active">Add New Employee</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
  <div class="container">
    <h2>Employee Registration</h2>
    
    <form action="submit_employee" method="post">
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" placeholder="Enter Email" required>

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" placeholder="Enter Password" required>

      <label for="role">Role:</label>
      <select id="role" name="role"  required>
        <option value="admin">Admin</option>
        <option value="employee">Employee</option>
      </select>

      <label for="fullname">Name:</label>
      <input type="text" id="fullname" name="fullname" placeholder="Enter Name" required>

      <label for="dob">Date of Birth:</label>
      <input type="date" id="dob" name="dob" required>

      <label for="contact">Contact:</label>
      <input type="text" id="contact" placeholder="Enter Phone" name="contact">

      <label for="gender">Gender:</label>
      <select id="gender" name="gender" required>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
      </select>

      <label for="position">Position:</label>
      <input type="text" id="position" placeholder="Enter Position" name="position">
      
      <label for="address">Address:</label>
      <input type="text" id="address" placeholder="Enter Address" name="address">

      <label for="bloodgroup">Blood Group:</label>
      <select id="bloodgroup" name="bloodgroup">
        <option value="A+">A+</option>
        <option value="A-">A-</option>
        <option value="B+">B+</option>
        <option value="B-">B-</option>
        <option value="AB+">AB+</option>
        <option value="AB-">AB-</option>
        <option value="O+">O+</option>
        <option value="O-">O-</option>
      </select>
<br>
       <button type="submit" class="btn btn-primary btn-block">Add Employee</button>
    </form>
    
  </div>
  </main>
  <script>
 function select(selector) {
	        return document.querySelector(selector);
	    }

	    function on(event, element, callback) {
	        document.addEventListener(event, function (e) {
	            if (e.target.closest(element)) {
	                callback(e);
	            }
	        });
	    }

	    if (select('.toggle-sidebar-btn')) {
	        on('click', '.toggle-sidebar-btn', function (e) {
	            const body = select('body');
	            body.classList.toggle('toggle-sidebar');
	            const icon = select('.toggle-sidebar-btn i');
	          
	            e.preventDefault(); // Prevent default behavior of the anchor tag
	        });
	    }
</script>
  
</body>
</html>
