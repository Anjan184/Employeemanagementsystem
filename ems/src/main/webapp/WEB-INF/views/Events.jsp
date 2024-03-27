<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<%@include file="./base.jsp"%>
<title>Events</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>
.event-table th,
    .event-table td {
      padding: 10px;
      border: 1px solid #ddd;
    }

    .event-table th {
      background-color: #f8f9fa;
      text-align: left;
      font-weight: bold;
    }

    .event-table td {
      text-align: left;
    }


</style>
</head>

<body>


	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="index" class="logo d-flex align-items-center"> <img
				src="resources/assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">ESS</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->


		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item dropdown">
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="resources/assets/img/profile-img.jpg" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">${currentUser.fullname}</span>
				</a>
				<!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>${currentUser.fullname}</h6> <span>${currentUser.position}</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile"> <i class="bi bi-person"></i> <span>My
									Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						

						<li><a class="dropdown-item d-flex align-items-center"
							href="pages-faq"> <i class="bi bi-question-circle"></i> <span>Need
									Help?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="signout"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul>
					<!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link " href="index">
					<i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>Basic</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
					<li><a href="Events"> <i class="bi bi-circle"></i><span>Events</span>
					</a></li>
					<li><a href="Holidays"> <i class="bi bi-circle"></i><span>Holiday Schedule</span>
					</a></li>

				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i><span>Attendance</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="tables-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
				
					
					<li><a href="Attendance_correction"> <i
							class="bi bi-circle"></i><span>Attendance</span>
					</a></li>
					
				</ul></li>
			<!-- End Tables Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-gem"></i><span>Leave Management</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="icons-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="Leave_application"> <i
							class="bi bi-circle"></i><span>Leave Application</span>
					</a>
					
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
					
					
					</li>
					
				</ul></li>
			<!-- End Icons Nav -->

			<li class="nav-heading">Pages</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="users-profile"> <i class="bi bi-person"></i> <span>Profile</span>
			</a></li>
			<!-- End Profile Page Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-contact"> <i class="bi bi-envelope"></i> <span>Contact</span>
			</a></li>
			<!-- End Contact Page Nav -->




		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Events</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index">Home</a></li>
					<li class="breadcrumb-item active">Basic</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<table class="event-table">
        <thead>
          <tr>
            <th>Id</th>
            <th>Date</th>
            <th>Event Name</th>
            <th>Event Time</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${event}" var="evnt">
            <tr>
              <td>${evnt.eventid}</td>
              <td>${evnt.date}</td>
              <td>${evnt.name}</td>
              <td>${evnt.time}</td>
              <td>
          	    <div>
                <a href="delt/${evnt.eventid}"><i class="fa-solid fa-trash text-danger">Delete</i></a>
            	</div>
            	</tr>
          </c:forEach>
        </tbody>
      </table>
      <br>
      
      <div style="text-align: center;">
  	 <a href="add_event"><strong>Add new Event</strong></a>
	</div>
		


		</section>

	</main>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>



</body>

</html>