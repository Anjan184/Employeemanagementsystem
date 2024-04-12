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
  <title>Employee Registration</title>
  <style>
  
     .container {
            max-width: 500px;
            margin-top: 50px;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .container h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 5px;
        }

.btn-primary {
    border-radius: 20px;
    width: 50%;
    margin: 0 auto; /* Center horizontally */
    display: flex; /* Use flexbox */
    justify-content: center; /* Center horizontally */
}

    body {
   
    
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 500px;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    select {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }

    select {
      height: 40px;
    }

    button {
      background-color: #4caf50;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }

    button:hover {
      background-color: #45a049;
    }
    
     input[type="date"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    /* Additional styling */
    background-color: #fff; /* Background color */
    color: #000; /* Text color */
    font-size: 16px; /* Font size */
    line-height: 1.5; /* Line height */
    outline: none; /* Remove outline */
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
          <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
           <li class="breadcrumb-item active">Add New Employee</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
  <div class="container">
    <h2>Employee Registration</h2>
    
    <form action="submit_employee" method="post">
    
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" placeholder="Enter Email" required>

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" placeholder="Enter Password" required>

      <label for="role">Role:</label>
      <select id="role" name="role"  required>
        <option value="admin">Admin</option>
        <option value="employee">Employee</option>
      </select>

      <label for="fullname">Name:</label>
      <input type="text" id="fullname" name="fullname" placeholder="Enter Name" required>

      <label for="dob">Date of Birth:</label>
      <input type="date" id="dob" name="dob" required>
	<br>
      <label for="contact">Contact:</label>
      <input type="text" id="contact" placeholder="Enter Phone" name="contact">

      <label for="gender">Gender:</label>
      <select id="gender" name="gender" required>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
      </select>

      <label for="position">Position:</label>
      <input type="text" id="position" placeholder="Enter Position" name="position">
      
      <label for="address">Address:</label>
      <input type="text" id="address" placeholder="Enter Address" name="address">

      <label for="bloodgroup">Blood Group:</label>
      <select id="bloodgroup" name="bloodgroup">
        <option value="A+">A+</option>
        <option value="A-">A-</option>
        <option value="B+">B+</option>
        <option value="B-">B-</option>
        <option value="AB+">AB+</option>
        <option value="AB-">AB-</option>
        <option value="O+">O+</option>
        <option value="O-">O-</option>
      </select>
<br>
       <button type="submit" class="btn btn-primary btn-block">Add Employee</button>
    </form>
    
  </div>
  </main>
  
  
</body>
</html>
