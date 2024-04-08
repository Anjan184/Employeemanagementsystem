<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./base.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="ems.entities.PunchOut"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>ESS</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>
 .attendance-table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

.attendance-table th, .attendance-table td {
	padding: 8px;
	border: 1px solid #ddd;
	text-align: center;
}

.attendance-table th {
	background-color: #f2f2f2;
}

.attendance-table tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}

.attendance-table tbody tr:hover {
	background-color: #ddd;
}

.attendance-table th {
	font-size: 14px; /* Adjust font size */
	color: #333; /* Darker text color */
	border: 1px solid #ccc; /* Lighter border color */
}

/* Additional styling for table rows */
.attendance-table td {
	font-size: 14px; /* Adjust font size */
	color: #555; /* Dark gray text color */
	border: 1px solid #ccc; /* Lighter border color */
}

/* Styling for hover effect */
.attendance-table tbody tr:hover td {
	background-color: #e2e2e2; /* Light gray background on hover */
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

.attendance-table td a {
	display: inline-block;
	padding: 8px 12px;
	background-color: #007bff; /* Blue background color */
	color: #fff; /* White text color */
	text-decoration: none; /* Remove default underline */
	border-radius: 4px; /* Rounded corners */
	transition: background-color 0.3s ease;
	/* Smooth transition on hover */
}

.attendance-table td a:hover {
	background-color: #0056b3; /* Darker blue on hover */
}
</style>
</head>

<body>

<%@include file="./Navemp.jsp" %>

	<main id="main" class="main">
<div class="pagetitle">
			<h1>Employee Attendance</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Attendance</li>
					<li class="breadcrumb-item "><a href="employee_attendance">Daily Attendance</a></li>
					<li class="breadcrumb-item active">Employee Attendance Details</li>
				</ol>
			</nav>
		</div>
		<section class="section dashboard">
			
			<table class="attendance-table">
				<thead>
					<tr>	
						<th>Date</th>
						<th>Punch In</th>
						<th>Punch Out</th>
						<th>Work done</th>
	
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${punchindetails}" var="punchInDetails"
					varStatus="status"	>
						<tr>
						
							<td>${punchInDetails.getPunchIn_Date()}</td>
							<td>${punchInDetails.getPunchIn()}</td>
							<td>${punchoutdetails[status.index].getPunchOut()}</td>
							<td>${elapsedTimes[status.index]}</td>           			   
						</tr>
					</c:forEach>
					
					<tr><!-- Row for total work of the day -->
						<td colspan="3" >Total Work of the Day</td>
						<td>${totalTime}</td>
					</tr>
				</tbody>
			</table>



		</section>

	</main>


</body>

</html>
