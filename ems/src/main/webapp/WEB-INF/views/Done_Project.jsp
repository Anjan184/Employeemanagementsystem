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
.task-table th, .task-table td {
	padding: 10px;
	border: 1px solid #ddd;
}

.task-table th {
	background-color: #f8f9fa;
	text-align: left;
	font-weight: bold;
}

.task-table td {
	text-align: left;
}

 .task-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
 
 .task-table tbody tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  .task-table tbody tr:nth-child(odd) {
    background-color: #ffffff;
  }

  .task-table tbody tr:hover {
    background-color: #e2e2e2;
  }

  /* Additional styling for table header */

  .task-table th {
    font-size: 14px; /* Adjust font size */
    color: #333; /* Darker text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Additional styling for table rows */

  .task-table td {
    font-size: 14px; /* Adjust font size */
    color: #555; /* Dark gray text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Styling for hover effect */

  .task-table tbody tr:hover td {
    background-color: #e2e2e2; /* Light gray background on hover */
  }

.add-new-project-btn {
	display: inline-block;
	padding: 10px 20px; /* Adjust padding */
	background-color: #007bff; /* Blue background color */
	color: white; /* White text color */
	text-decoration: none; /* Remove underline */
	border-radius: 5px; /* Rounded border */
	transition: background-color 0.3s ease; /* Smooth transition */
}

/* Hover effect */
.add-new-project-btn:hover {
	background-color: #0056b3; /* Darker blue background on hover */
}
</style>
</head>

<body>
	<%@include file="./Navadmin.jsp"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Done Project</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Projects</li>
					<li class="breadcrumb-item Active">Done Project</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">

			<table class="task-table">
				<thead>
					<tr>
						<th>Project_Id</th>
						<th>Project Name</th>
						<th>Assigned By</th>
						<th>Project Due</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${project}" var="p">
						<tr>
							<td>${p.project_id}</td>
							<td>${p.project_name}</td>
							<td>${currentUser.fullname}</td>
							<td>${p.projectduedate}</td>
							<td><a href="Done_tasks?project_id=${p.getProject_id()}" class="btn btn-primary" style="border-radius:30px;"> <i class="bi bi-people-fill"></i> Done Tasks</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>



			<br>

		

		</section>

	</main>



</body>

</html>