<%@page import="ems.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>ESS</title>
<meta content="" name="description">
<meta content="" name="keywords">

<style>
.task-table {
	width: 103%;
	border-collapse: collapse;
	margin: 0 auto;
}

.task-table th, .task-table td {
	padding: 10px;
	border: 1px solid #ddd; /* Border style */
}

.task-table th {
	background-color: #f2f2f2; /* Header background color */
	font-weight: bold;
}

.task-table tbody tr:nth-child(even) {
	background-color: #f9f9f9; /* Alternate row background color */
}

.add-new-task-btn {
	display: inline-block;
	padding: 10px 20px; /* Adjust padding */
	background-color: #007bff; /* Blue background color */
	color: white; /* White text color */
	text-decoration: none; /* Remove underline */
	border-radius: 5px; /* Rounded border */
	transition: background-color 0.3s ease; /* Smooth transition */
}

/* Hover effect */
.add-new-task-btn:hover {
	background-color: #0056b3; /* Darker blue background on hover */
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
						width="40" height="50" alt="Profile" class="rounded-circle">
						<span class="d-none d-md-block dropdown-toggle ps-2">${currentUser.fullname}</span>
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
					</a></li>

					<li><a href="approved_application"> <i
							class="bi bi-circle"></i><span>Approved Application</span>
					</a></li>

					<li><a href="rejected_application"> <i
							class="bi bi-circle"></i><span>Rejected Application</span>
					</a></li>

				</ul></li>


			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#assign-tasks-nav" data-bs-toggle="collapse"
				href="#"> <i class="bi bi-check2-square"></i><span>Tasks</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="assign-tasks-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="Admin_tasks"> <i class="bi bi-circle"></i><span>Assign
								Tasks</span>
					</a></li>
				</ul></li>
			<!-- End Tables Nav -->



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
			<h1>Tasks</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Tasks</li>
					<li class="breadcrumb-item Active">Assign Tasks</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">

			<table class="task-table">
				<thead>
					<tr>
						<th>Task_Id</th>
						<th>Task Name</th>
						<th>Description</th>
						<th>Assigned To</th>
						<th>Assigned By</th>
						<th>Due Date</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${task}" var="tsk">
						<tr>
							<td>${tsk.task_id}</td>
							<td>${tsk.task_name}</td>
							<td>${tsk.description}</td>
							<td>${tsk.assignedTo}</td>
							<td>${currentUser.fullname}</td>
							<td>${tsk.due_date}</td>
							<td>${tsk.status}</td>
							<td><div>
									<a href="dlete/${tsk.task_id}"><i
										class="fa-solid fa-trash text-danger">Delete</i></a>
								</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>



			<br>

			<div style="text-align: center;">
				<a href="add_task" class="add-new-task-btn"><strong>Add
						new Task</strong></a>
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



</body>

</html>