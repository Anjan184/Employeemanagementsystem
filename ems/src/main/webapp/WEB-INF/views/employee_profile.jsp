<%@page import="ems.entities.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Profile</title>
<meta content="" name="description">
<meta content="" name="keywords">

<%@include file="./base.jsp"%>


</head>

<body>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>ESS</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>
.profile {
	padding: 30px;
}

/* Profile card styles */
.profile-card {
	text-align: center;
}

/* Profile name styles */
.profile-card h2 {
	margin-bottom: 5px;
	color: #333; /* Dark text color */
}

/* Profile position styles */
.profile-card h3 {
	margin-bottom: 20px;
	color: #666; /* Medium dark text color */
}

/* Overview section styles */
.profile-overview {
	padding-top: 20px;
}

/* Label styles */
.label {
	font-weight: bold;
	color: #777; /* Medium light text color */
}

/* Details styles */
.details {
	color: #555; /* Medium text color */
	margin-bottom: 10px;
}

/* Navigation tabs styles */
.nav-tabs-bordered .nav-link {
	border: none;
	background-color: transparent;
	color: #333; /* Dark text color */
	border-bottom: 2px solid transparent;
}

/* Active tab styles */
.nav-tabs-bordered .nav-link.active {
	color: #007bff; /* Blue text color */
	border-bottom-color: #007bff; /* Blue border color */
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
					<li><a href="employee_events"> <i class="bi bi-circle"></i><span>Events</span>
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

			<!-- Punch Out button -->
			<li class="nav-item"><a href="punchout"
				class="punch-btn punch-out-btn">Punch Out</a></li>


		</ul>

	</aside>
	<!-- End Sidebar-->


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Profile</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="employee_dashboard">Home</a></li>
					<li class="breadcrumb-item">Users</li>
					<li class="breadcrumb-item active">Profile</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section profile">
			<div class="row">
				<div class="col-xl-4">

					<div class="card">
						<div
							class="card-body profile-card pt-4 d-flex flex-column align-items-center">

							<img src="data:profilePicture/jpeg;base64,<%=session.getAttribute("img")%>"  width="150" height="150" alt="Profile" class="rounded-circle">
							
							<h2>${currentUser.fullname}</h2>
							<h3>${currentUser.position}</h3>

						</div>
					</div>

				</div>

				<div class="col-xl-8">

					<div class="card">
						<div class="card-body pt-3">
							<!-- Bordered Tabs -->
							<ul class="nav nav-tabs nav-tabs-bordered">

								<li class="nav-item">
									<button class="nav-link active" data-bs-toggle="tab"
										data-bs-target="#profile-overview">Overview</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-edit">Edit Profile</button>
								</li>
							</ul>

							<div class="tab-content pt-2">

								<div class="tab-pane fade show active profile-overview"
									id="profile-overview">


									<div class="row">
										<div class="col-lg-3 col-md-4 label ">Full Name</div>
										<div class="col-lg-9 col-md-8">${currentUser.fullname}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Company</div>
										<div class="col-lg-9 col-md-8">DRC Systems</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Role</div>
										<div class="col-lg-9 col-md-8">${currentUser.position}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Address</div>
										<div class="col-lg-9 col-md-8">${currentUser.address}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Gender</div>
										<div class="col-lg-9 col-md-8">${currentUser.gender}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Phone</div>
										<div class="col-lg-9 col-md-8">${currentUser.contact}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Email</div>
										<div class="col-lg-9 col-md-8">${currentUser.email}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Blood Group</div>
										<div class="col-lg-9 col-md-8">${currentUser.bloodgroup}</div>
									</div>


								</div>


							</div>
							<!-- End Bordered Tabs -->

						</div>


						<div class="tab-content pt-2">
							<div class="tab-pane fade show profile-edit pt-2" id="profile-edit">


								<form action="editprofile" method="post" enctype="multipart/form-data" >


								<div class="row mb-3">
							        <label class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
							        <div class="col-md-8 col-lg-9">
							            <input type="file" name="profilePicture" id="profilePicture" class="form-control" >
							        </div>
							    </div> 
																		
									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Full
											Name</label>
										<div class="col-md-8 col-lg-9">
											<input name="fullname" type="text" class="form-control"
												id="fullname" value="${currentUser.fullname}">
										</div>
									</div>


									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Address</label>
										<div class="col-md-8 col-lg-9">
											<input name="address" type="text" class="form-control"
												id="address" value="${currentUser.address}">
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Phone</label>
										<div class="col-md-8 col-lg-9">
											<input name="contact" type="text" class="form-control"
												id="contact" value="${currentUser.contact}">
										</div>
									</div>

									<div class="row mb-3">
										<label  class="col-md-4 col-lg-3 col-form-label">Gender</label>
										<div class="col-md-8 col-lg-9">
											<select name="gender" class="form-select">
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select>
										</div>
									</div>


									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Email</label>
										<div class="col-md-8 col-lg-9">
											<input name="email" type="email" class="form-control"
												id="email" value="${currentUser.email}">
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">New
											Password</label>
										<div class="col-md-8 col-lg-9">
											<input name="password" type="password" class="form-control"
												id="password" value="${currentUser.password}">
										</div>
									</div>
									
									<div class="row mb-3">
										<label  class="col-md-4 col-lg-3 col-form-label">BloodGroup</label>
										<div class="col-md-8 col-lg-9">
											<select name="bloodgroup" class="form-select">
												<option value="A+">A+</option>
												<option value="A-">A-</option>
												<option value="B+">B+</option>
												<option value="B-">B-</option>
												<option value="AB+">AB+</option>
												<option value="AB-">AB-</option>
												<option value="O+">O+</option>
												<option value="O-">O-</option>
											</select>
										</div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">Save
											Changes</button>
									</div>

								</form>
								<!-- End Profile Edit Form -->

							</div>
						</div>
					</div>

				</div>

			</div>
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


	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

</body>

</html>