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

  			body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        

        label {
            font-weight: bold;
        }

        input[type="date"],
        input[type="text"],
        input[type="time"] {
            width: 100%;
            padding: 8px;
            
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width:40%;
            margin-left:140px;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }
       .fm {
    width: 50%;
    margin-left: 220px;
    border: 2px solid green; /* Set border color to blue */
    border-radius: 10px; /* Add border-radius for rounded corners */
    padding: 20px; /* Add padding for better spacing */
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
						src="data:profilePicture/jpeg;base64,<%=session.getAttribute("img")%>"
						width="50" height="50" alt="Profile" class="rounded-circle">
						<span class="d-none d-md-block dropdown-toggle ps-2">${currentUser.fullname}</span>
				</a> <!-- End Profile Iamge Icon -->

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

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link " href="index"> <i
					class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>Basic</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="Events"> <i class="bi bi-circle"></i><span>Events</span>
					</a></li>
					<li><a href="Holidays"> <i class="bi bi-circle"></i><span>Holiday
								Schedule</span>
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
					<i class="bi bi-house-door"></i><span>Leave Management</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="icons-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="Leave_application"> <i class="bi bi-circle"></i><span>Leave
								Application</span>
					</a>
					<li><a href="approved_application"> <i
							class="bi bi-circle"></i><span>Approved Application</span>
					</a></li>

					<li><a href="rejected_application"> <i
							class="bi bi-circle"></i><span>Rejected Application</span>
					</a></li></li>

		</ul>
		</li>
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
		  <form action="add_new_event" method="post" class="fm">
    <h1 style="text-align:center">Edit Event</h1>
   	 <label for="eventid"></label>
      <input type="hidden" id="eventid" value="${eve.eventid}" name="eventid" required>
    
      <label for="date">Date:</label>
      <input type="date" id="date" value="${eve.date}" name="date" required>
		
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="${eve.name}" required>
    
       <label for="time">Time:</label>
      <input type="time" id="time" name="time" value="${eve.time}" required>
    <br><br>
      <button type="submit" class="btn btn-primary btn-block">Save</button>
    </form>


		</section>

	</main>
	<!-- End #main -->
	<script>
		function select(selector) {
			return document.querySelector(selector);
		}

		function on(event, element, callback) {
			document.addEventListener(event, function(e) {
				if (e.target.closest(element)) {
					callback(e);
				}
			});
		}

		if (select('.toggle-sidebar-btn')) {
			on('click', '.toggle-sidebar-btn', function(e) {
				const body = select('body');
				body.classList.toggle('toggle-sidebar');
				const icon = select('.toggle-sidebar-btn i');

				e.preventDefault(); // Prevent default behavior of the anchor tag
			});
		}
	</script>


</body>

</html>