<%@page import="ems.entities.User"%>
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

.employee-table {
    width: 103%;
    border-collapse: collapse;
    margin: 0 auto;
}

.employee-table th, .employee-table td {
    padding: 10px;
    border: 1px solid #ddd; /* Border style */
}

.employee-table th {
    background-color: #f2f2f2; /* Header background color */
    font-weight: bold;
}

.employee-table tbody tr:nth-child(even) {
    background-color: #f9f9f9; /* Alternate row background color */
}

.add-new-employee-btn {
        display: inline-block;
        padding: 10px 20px; /* Adjust padding */
        background-color: #007bff; /* Blue background color */
        color: white; /* White text color */
        text-decoration: none; /* Remove underline */
        border-radius: 5px; /* Rounded border */
        transition: background-color 0.3s ease; /* Smooth transition */
    }

    /* Hover effect */
    .add-new-employee-btn:hover {
        background-color: #0056b3; /* Darker blue background on hover */
    }
</style>
</head>

<body>
 <%@include file="./Navadmin.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Admin Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
<h2 style="text-align:center;">All Employees and Admins</h2>
<br>

<table class="employee-table">
    <thead>
        <tr>
       	    <th>User Id</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Email</th>
           <th>Password
            <th>Position</th>
            <th>Blood Group</th>
       
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${employees}" var="employee">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.fullname}</td>
                <td>${employee.contact}</td>
                <td>${employee.email}</td>
                <td>${employee.password}</td>
                <td>${employee.position}</td>
                <td>${employee.bloodgroup}</td>
            
                
                <td><div>
                <a href="edit_employee/${employee.id}"><i class="fa-solid fa-pen-nib text-primary">Edit</i></a>
                <a href="delete/${employee.id}"><i class="fa-solid fa-trash text-danger">Delete</i></a>
          	    </div></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
	<br>
				
	<div style="text-align: center;">
   <a href="add_new_employee" class="add-new-employee-btn"><strong>Add new employee</strong></a>
	</div>
     
    </section>

  </main><!-- End #main -->




</body>

</html>