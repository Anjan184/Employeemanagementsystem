<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="./base.jsp" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ESS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<style>


 
    .punch-btn {
      display: block;
      width: 80%;
      padding: 8px;
      margin-bottom: 10px;
      border: none;
      margin-left:8px;
      cursor: pointer;
      font-size: 16px;
      text-align: center;
      color: #fff;
      border-radius:30px;
    }

    .punch-in-btn {
      background-color: green;
    }

    .punch-out-btn {
      background-color: red;
    }
	
	.event-table th,
    .event-table td {
      padding: 10px;
      border: 1px solid #ddd;
      text-align: left;
      
    }

    .event-table th {
      background-color: #f8f9fa;
  
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

  
</style>
</head>

<body>
 <%@include file="./Navemp.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Employee Events</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item ">Basic</li>
          <li class="breadcrumb-item active">Events</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

   <section class="section dashboard">
		<table class="event-table">
  <thead>
    <tr>
      <th>Id</th>
      <th>Date</th>
      <th>Event Name</th>
      <th style="padding-right: 5px;">Event Time</th> <!-- Adjusted padding for the event time column -->
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${event}" var="evnt">
      <tr>
        <td>${evnt.eventid}</td>
        <td>${evnt.date}</td>
        <td>${evnt.name}</td>
        <td>${evnt.time}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>
		</section>

  </main><!-- End #main -->
  
  	


</body>

</html>