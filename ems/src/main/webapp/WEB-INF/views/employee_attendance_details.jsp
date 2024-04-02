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
 /* Table styling */
    .attendance-table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
    }

    /* Table header styling */
    .attendance-table th {
        padding: 12px; /* Adjust padding */
        background-color: #f2f2f2; /* Light gray background */
        color: #333; /* Dark text color */
        border: 1px solid #ddd; /* Light gray border */
        text-align: center; /* Center-align text */
    }

    /* Table body row styling */
    .attendance-table td {
        padding: 10px; /* Adjust padding */
        border: 1px solid #ddd; /* Light gray border */
        text-align: center; /* Center-align text */
    }

    /* Alternate row background color */
    .attendance-table tbody tr:nth-child(even) {
        background-color: #f9f9f9; /* Light gray background for even rows */
    }

    /* Hover effect */
    .attendance-table tbody tr:hover {
        background-color: #f2f2f2; /* Darker gray background on hover */
    }

    /* Styling for punch-in and punch-out buttons */
    .punch-btn {
        display: inline-block;
        padding: 8px 16px; /* Adjust padding */
        border: none;
        cursor: pointer;
        font-size: 14px; /* Adjust font size */
        text-align: center;
        border-radius: 20px; /* Rounded border */
        transition: background-color 0.3s ease; /* Smooth transition */
    }

    /* Styling for punch-in button */
    .punch-in-btn {
        background-color: green;
        color: white; /* White text color */
    }

    /* Styling for punch-out button */
    .punch-out-btn {
        background-color: red;
        color: white; /* White text color */
    }

    /* Styling for back-to-top button */
    .back-to-top {
        position: fixed;
        bottom: 20px; /* Adjust position */
        right: 20px; /* Adjust position */
        background-color: #007bff; /* Blue background */
        color: white; /* White text color */
        width: 40px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        border-radius: 50%; /* Rounded border */
        transition: background-color 0.3s ease; /* Smooth transition */
    }

    /* Hover effect for back-to-top button */
    .back-to-top:hover {
        background-color: #0056b3; /* Darker blue background on hover */
    }

</style>
</head>

<body>

	<main id="main" class="main">

		<section class="section dashboard">
			<h1 style="text-align: center;">Employee Attendance Details</h1>
			
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



</body>

</html>
