<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<%@include file="./base.jsp"%>
<title>Events</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>
.event-table th,
    .event-table td {
      padding: 10px;
      border: 1px solid #ddd;
    }

    .event-table th {
      background-color: #f8f9fa;
      text-align: left;
      font-weight: bold;
    }

    .event-table td {
      text-align: left;
    }

 .event-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    
    .event-table tbody tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  .event-table tbody tr:nth-child(odd) {
    background-color: #ffffff;
  }

  .event-table tbody tr:hover {
    background-color: #e2e2e2;
  }

  /* Additional styling for table header */

  .event-table th {
    font-size: 14px; /* Adjust font size */
    color: #333; /* Darker text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Additional styling for table rows */

  .event-table td {
    font-size: 14px; /* Adjust font size */
    color: #555; /* Dark gray text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Styling for hover effect */

  .event-table tbody tr:hover td {
    background-color: #e2e2e2; /* Light gray background on hover */
  }

.add-event-btn {
        display: inline-block;
        padding: 10px 20px; /* Adjust padding */
        background-color: #007bff; /* Blue background color */
        color: white; /* White text color */
        text-decoration: none; /* Remove underline */
        border-radius: 5px; /* Rounded border */
        transition: background-color 0.3s ease; /* Smooth transition */
    }

    /* Hover effect */
    .add-event-btn:hover {
        background-color: #0056b3; /* Darker blue background on hover */
    }
</style>
</head>

<body>


	<%@include file="./Navadmin.jsp" %>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Events</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Basic</li>
					<li class="breadcrumb-item active">Events</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<table class="event-table">
        <thead>
          <tr>
            <th>Id</th>
            <th>Date</th>
            <th>Event Name</th>
            <th>Event Time</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${event}" var="evnt">
            <tr>
              <td>${evnt.eventid}</td>
              <td>${evnt.date}</td>
              <td>${evnt.name}</td>
              <td>${evnt.time}</td>
              <td>
          	    <div>
          	     <a href="edit_event?eventid=${evnt.eventid}"><i class="fa-solid fa-pen-nib text-primary">Edit</i></a>
                <a href="delt/${evnt.eventid}"><i class="fa-solid fa-trash text-danger">Delete</i></a>
            	</div>
            	</tr>
          </c:forEach>
        </tbody>
      </table>
      <br>
      
      <div style="text-align: center;">
  	 <a href="add_event" class="add-event-btn"><strong>Add new Event</strong></a>
	</div>
		
		


		</section>

	</main>
	<!-- End #main -->


</body>

</html>