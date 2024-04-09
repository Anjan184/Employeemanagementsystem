<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
 <%@include file="./base.jsp" %>
  <title>Holidays</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<style>
.holiday-table th,
    .holiday-table td {
      padding: 10px;
      border: 1px solid #ddd;
    }

    .holiday-table th {
      background-color: #f8f9fa;
      text-align: left;
      font-weight: bold;
    }

    .holiday-table td {
      text-align: left;
    }

 .holiday-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

  .holiday-table tbody tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  .holiday-table tbody tr:nth-child(odd) {
    background-color: #ffffff;
  }

  .holiday-table tbody tr:hover {
    background-color: #e2e2e2;
  }

  /* Additional styling for table header */

  .holiday-table th {
    font-size: 14px; /* Adjust font size */
    color: #333; /* Darker text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Additional styling for table rows */

  .holiday-table td {
    font-size: 14px; /* Adjust font size */
    color: #555; /* Dark gray text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Styling for hover effect */

  .holiday-table tbody tr:hover td {
    background-color: #e2e2e2; /* Light gray background on hover */
  }
  
  .add-holiday-btn {
        display: inline-block;
        padding: 10px 20px; /* Adjust padding */
        background-color: #007bff; /* Blue background color */
        color: white; /* White text color */
        text-decoration: none; /* Remove underline */
        border-radius: 5px; /* Rounded border */
        transition: background-color 0.3s ease; /* Smooth transition */
    }

    /* Hover effect */
    .add-holiday-btn:hover {
        background-color: #0056b3; /* Darker blue background on hover */
    }

</style>
</head>

<body>

  <%@include file="./Navadmin.jsp" %>


  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Holidays</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Basic</li>
          <li class="breadcrumb-item active">Holidays</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
    <table class="holiday-table">
        <thead>
          <tr>
            <th>Id</th>
            <th>From Date</th>
            <th>To Date</th>
            <th>Name</th>
            <th>Days</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${holiday}" var="hlday">
            <tr>
              <td>${hlday.id}</td>
              <td>${hlday.fromdate}</td>
              <td>${hlday.date}</td>
              <td>${hlday.name}</td>
              <td>${hlday.days}</td>
              <td>
          	    <div>
          	      <a href="edit_holiday?id=${hlday.id}"><i class="fa-solid fa-pen-nib text-primary"></i></a>
                <a href="dlt/${hlday.id}"><i class="fa-solid fa-trash text-danger"></i></a>
            	</div>
            	</tr>
          </c:forEach>
        </tbody>
      </table>
      <br>
      
      <div style="text-align: center;">
  	 <a href="add_new_holiday" class="add-holiday-btn"><strong>Add new Holiday</strong></a>
	</div>
	
    </section>

  </main><!-- End #main -->

  
</body>

</html>