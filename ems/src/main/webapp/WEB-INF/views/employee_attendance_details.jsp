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

	<main id="main" class="main">

		<section class="section dashboard">
			<h1 style="text-align: center;">Employee Attendance</h1>
			
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
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>



</body>

</html>
