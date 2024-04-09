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
 button[type="submit"] {
            background-color: green;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width:20%;
            margin-left:10px;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }
</style>
</head>

<body>
	<%@include file="./Navemp.jsp"%>

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

						<th>Assigned By</th>
						<th>Task Name</th>
						<th>Description</th>
						<th>Due Date</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${task}" var="tsk">
						<tr>
							<td>${tsk.assignedBy}</td>
							<td>${tsk.task_name}</td>
							<td>${tsk.description}</td>
							<td>${tsk.due_date}</td>
							<td>${tsk.status }</td>
							<td>
								<form action="saveStatus/${tsk.task_id}" method="post">
									<select  name="status" required>
											<option value="Todo">TODO</option>
											<option value="In_Progress">IN PROGRESS</option>
											<option value="Done">DONE</option>
									</select>
									 <button type="submit" class="btn btn-primary btn-block"><i class="fa-solid fa-circle-check"></i></button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>



			<br>


		</section>

	</main>



</body>

</html>