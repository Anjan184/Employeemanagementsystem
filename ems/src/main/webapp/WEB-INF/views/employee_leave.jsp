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



.leave-table th, .leave-table td {
	padding: 10px;
	border: 1px solid #ddd;
}

.leave-table th {
	background-color: #f8f9fa;
	text-align: left;
	font-weight: bold;
}

.leave-table td {
	text-align: left;
}

  .leave-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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

 .leave-table th {
    font-size: 14px; /* Adjust font size */
    color: #333; /* Darker text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Additional styling for table rows */

  .leave-table td {
    font-size: 14px; /* Adjust font size */
    color: #555; /* Dark gray text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Styling for hover effect */

  .leave-table tbody tr:hover td {
    background-color: #e2e2e2; /* Light gray background on hover */
  }
  
  .add-leave-btn {
        display: inline-block;
        padding: 10px 20px; /* Adjust padding */
        background-color: #007bff; /* Blue background color */
        color: white; /* White text color */
        text-decoration: none; /* Remove underline */
        border-radius: 5px; /* Rounded border */
        transition: background-color 0.3s ease; /* Smooth transition */
    }

    /* Hover effect */
    .add-leave-btn:hover {
        background-color: #0056b3; /* Darker blue background on hover */
    }
    
    
</style>
</head>

<body>
	
	<%@include file="./Navemp.jsp" %>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Employee Leave</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Leave Management</li>
					<li class="breadcrumb-item Active">Leave Application</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section ">
			<table class="leave-table">
				<thead> 
					<tr>
						<th>Id</th>
						<th>From Date</th>
						<th>To Date</th>
						<th>Leave Type</th>
						<th>Reason</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${leaves}" var="leave">
						<tr>
							<td>${leave.leave_Id}</td>
							<td>${leave.from_Date}</td>
							<td>${leave.to_Date}</td>
							<td>${leave.leave_type}</td>
							<td>${leave.reason}</td>
							<td>${leave.status}</td>
							<td>
								<div>
									<a href="deleted/${leave.leave_Id}"><i
										class="fa-solid fa-trash text-danger">Delete</i></a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<br>

			<div style="text-align: center;">
				<a href="add_new_leave"  class="add-leave-btn"><strong>Add new Leave</strong></a>
			</div>

		</section>

	</main>

</body>

</html>