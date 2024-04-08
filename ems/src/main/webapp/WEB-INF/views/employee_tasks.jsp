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
	<%@include file="./Navemp.jsp" %>

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
					
						<th>Task Name</th>
						<th>Description</th>
						<th>Assigned By</th>
						<th>Due Date</th>
						<th>Status</th>
					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${task}" var="tsk">
						<tr>
							<td>${tsk.task_name}</td>
							<td>${tsk.description}</td>
							<td>${tsk.assignedBy}</td>
							<td>${tsk.due_date}</td>
							<td>${tsk.status}</td>
							
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
	


</body>

</html>