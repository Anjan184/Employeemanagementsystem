<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./base.jsp"%>
<%@ page import="ems.control.MainController"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">



<title>ESS</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>
.toggle-sidebar #sidebar {
	width: 350px; /* Set your desired max width */
}

/* Adjust main content width when toggle-sidebar class is applied */
.toggle-sidebar #main {
	margin-left: 20px; /* Same as the sidebar width */
}

.highlighted {
	background-color: red;
	color: white;
	/* Optionally, change text color to white for better visibility */
	border-radius: 50%;
	/* Optionally, add border-radius for rounded corners */
}

.carousel-item {
	text-align: center;
}

/* Adjust styles for horizontal date display */
.carousel-item ul {
	list-style: none;
	padding: 0;
	display: flex;
	flex-wrap: wrap; /* Allow dates to wrap to new line */
	justify-content: center;
}

.carousel-item li {
	margin: 5px; /* Adjust spacing between dates */
	width: 15%; /* Set width to ensure 6 dates fit in one row */
}

/* Customize slider controls */
.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: red;
	/* Change the background color of the slider controls */
	color: white; /* Change the color of the slider controls' icons */
	font-size: 1rem;
	/* Change the font size of the slider controls' icons to make them smaller */
	width: 0.7rem; /* Set the width of the slider controls' icons */
	height: 1rem; /* Set the height of the slider controls' icons */
	border-radius: 13px;
	margin-bottom: 240px;
}

/* Optional: Increase the size of the slider controls' icons */
.carousel-control-prev-icon::before, .carousel-control-next-icon::before
	{
	font-size: 1rem;
	/* Change the font size of the icons inside the slider controls */
}

.section.dashboard {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.total-time, .total-leaves {
	margin-bottom: 10px;
}

.total-time .bi, .total-leaves .bi {
	color: #4CAF50; /* Green color for clock icon */
}

.total-time-value, .total-leaves-value {
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
	margin-left: 8px;
	cursor: pointer;
	font-size: 16px;
	text-align: center;
	color: #fff;
	border-radius: 30px;
}

.punch-in-btn {
	background-color: green;
}

.punch-out-btn {
	background-color: red;
}

.toggle-sidebar {
	left: 0
}
</style>
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="employee_dashboard" class="logo d-flex align-items-center">
				<img src="resources/assets/img/logo.png" alt=""> <span
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
						src="data:profilePicture/jpeg;base64,<%=session.getAttribute("img")%>"  width="50" height="50" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">${currentUser.fullname}</span>
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
							href="employee_profile"> <i class="bi bi-person"></i> <span>My
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

			<li class="nav-item"><a class="nav-link "
				href="employee_dashboard"> <i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>Basic</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="employee_events"> <i class="bi bi-circle "
							style="text-decoration: none;"></i><span>Events</span>
					</a></li>
					<li><a href="employee_holidays"> <i class="bi bi-circle"></i><span>Holiday
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
					<li><a href="employee_attendance"> <i class="bi bi-circle"></i><span>Daily
								attendance</span>
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
					<li><a href="employee_leave"> <i class="bi bi-circle"></i><span>Leave
								Application</span>
					</a></li>

				</ul></li>
			<!-- End Icons Nav -->

			<li class="nav-heading">Pages</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="employee_profile"> <i class="bi bi-person"></i> <span>Profile</span>
			</a></li>
			<!-- End Profile Page Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				href="employee_contact"> <i class="bi bi-envelope"></i> <span>Contact</span>
			</a></li>
			<!-- End Contact Page Nav -->

			<br>
			<br>
			<br>
			<br>
			<br>

			<li class="nav-item"><a href="punchin"
				class="punch-btn punch-in-btn">Punch In</a></li>


			<li class="nav-item"><a href="punchout"
				class="punch-btn punch-out-btn">Punch Out</a></li>


		</ul>

	</aside>


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Employee Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="employee_dashboard">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>



		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="card border-0 shadow-lg rounded"
						style="height: 310px; width: 75%; margin-top: 3px; margin-left: 80px; border: 2px solid #ccc; background-color: #f8f9fa;">
						<div class="card-body">
							<h5 class="card-title text-center"
								style="margin-top: -2%; color: #343a40;">Holidays Calendar</h5>
							<div id="holidaysCarousel" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach items="${monthsAndYear}" var="monthYear"
										varStatus="status">
										<div
											class="carousel-item <c:if test="${status.index eq 0}">active</c:if>">
											<div class="row">
												<b class="text-center " style="margin-top: -5px;">${monthYear}</b>
											</div>
											<div class="row">
												<ul class="list-inline text-center ">
													<li class="list-inline-item" style="width: 10.28%">Mon</li>
													<li class="list-inline-item" style="width: 9.28%">Tue</li>
													<li class="list-inline-item" style="width: 10.28%">Wed</li>
													<li class="list-inline-item" style="width: 9.28%">Thu</li>
													<li class="list-inline-item" style="width: 9.28%">Fri</li>
													<li class="list-inline-item" style="width: 9.28%">Sat</li>
													<li class="list-inline-item" style="width: 9.28%">Sun</li>
												</ul>
											</div>
											<div class="row">
												<ul class="list-inline text-center"
													style="margin-top: -11px;">
													<c:forEach items="${monthsAndDays[status.index]}"
														var="dayOfMonth" varStatus="dayStatus">
														<c:set var="highlight" value="false" />
														<c:set var="dayString" value="${dayOfMonth}" />
														<c:if test="${MonthAndYearInHolidays.contains(monthYear)}">
															<c:if
																test="${DateOfHolidays.contains(dayString.concat(monthYear)) || ToDateOfHolidays.contains(dayString.concat(monthYear))}">
																<c:set var="highlight" value="true" />
																<c:set var="highlight" value="true" />
															</c:if>
														</c:if>
														<li
															class="list-inline-item ${highlight ? 'highlighted' : ''}"
															style="width: 9.28%">${dayOfMonth}</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</c:forEach>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#holidaysCarousel" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#holidaysCarousel" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="card border-0 shadow-lg rounded"
						style="height: 310px; width: 75%; margin-top: 3px;margin-left:70px; border: 2px solid #ccc; background-color: #f8f9fa;">
						<div class="card-body">
							<h5 class="card-title text-center mb-4" style="color: #343a40;margin-top: -2%;">Events
								Calendar</h5>
							<div id="eventsCarousel" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner" style="margin-top: -5%;">
									<c:forEach items="${monthsAndYear}" var="monthYear"
										varStatus="status">
										<div
											class="carousel-item <c:if test="${status.index eq 0}">active</c:if>">
											<div class="row">
												<!-- Display month and year -->
												<b class="text-center" style="margin-top: -5px;">${monthYear}</b>
											</div>
											<div class="row">
												<!-- Display days of the week -->
												<ul class="list-inline text-center">
													<li class="list-inline-item" style="width: 10.28%">Mon</li>
													<li class="list-inline-item" style="width: 9.28%">Tue</li>
													<li class="list-inline-item" style="width: 10.28%">Wed</li>
													<li class="list-inline-item" style="width: 9.28%">Thu</li>
													<li class="list-inline-item" style="width: 9.28%">Fri</li>
													<li class="list-inline-item" style="width: 9.28%">Sat</li>
													<li class="list-inline-item" style="width: 9.28%">Sun</li>
												</ul>
											</div>
											<div class="row">
												<ul class="list-inline text-center"
													style="margin-top: -13px;">
													<c:forEach items="${monthsAndDays[status.index]}"
														var="dayOfMonth" varStatus="dayStatus">
														<c:set var="highlight" value="false" />
														<c:set var="dayString" value="${dayOfMonth}" />
														<c:if test="${MonthAndYearInEvent.contains(monthYear)}">
															<c:if
																test="${DateOfEvent.contains(dayString.concat(monthYear))}">
																<c:set var="highlight" value="true" />
																<c:set var="highlight" value="true" />
															</c:if>
														</c:if>
														<li
															class="list-inline-item ${highlight ? 'highlighted' : ''}"
															style="width: 9.28%">${dayOfMonth}</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</c:forEach>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#eventsCarousel" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#eventsCarousel" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<div class="container">
			<div class="row">

				<div class="col-md-4">
					<div class="card bg-primary border-0 shadow-lg rounded"
						style="height: 115px;">
						<div class="card-body " style="border-radius: 30px;">
							<h5 class="card-title mb-3"
								style="font-size: 1.2rem; color: #fff;">Total Time</h5>
							<div class="total-time">
								<span class="total-time-value"
									style="font-size: 1.5rem; color: white;">${totalTime}</span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card bg-success border-0 shadow-lg rounded"
						style="height: 115px;">
						<div class="card-body " style="border-radius: 30px;">
							<h5 class="card-title mb-3"
								style="font-size: 1.2rem; color: #fff;">Total Leaves
								Applied</h5>
							<div class="total-leaves">
								<span class="total-leaves-value"
									style="font-size: 1.5rem; color: white;">${totalLeaves}</span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card bg-danger border-0 shadow-lg rounded"
						style="height: 115px;">
						<div class="card-body " style="border-radius: 30px;">
							<h5 class="card-title mb-3"
								style="font-size: 1.2rem; color: #fff;">Extra Time</h5>
							<div class="total-time">
								<span class="total-time-value"
									style="font-size: 1.5rem; color: white;">${ExtraTime}</span>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

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
					// Toggle icon based on body class
					if (body.classList.contains('toggle-sidebar')) {

						icon.classList.remove('bi-list');
						// Change to your desired icon when sidebar is toggled
					} else {
						icon.classList.remove('bi-x'); // Change to your desired icon when sidebar is not toggled
						icon.classList.add('bi-list');

					}
					e.preventDefault(); // Prevent default behavior of the anchor tag
				});
			}
		</script>


	</main>




</body>


</html>