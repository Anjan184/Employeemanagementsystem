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
  </style>
</head>


<body>

   <%@include file="./Navadmin.jsp" %>
 

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Add Holidays</h1>
      <nav>
        <ol class="breadcrumb">
       
          <li class="breadcrumb-item">Basic</li>
            <li class="breadcrumb-item"><a href="Holidays">Holidays</a></li>
           <li class="breadcrumb-item active">Add New Holiday</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
  <div class="container">
    <h2> Add Holiday</h2>
    
    <form action="add_holiday" method="post">

      <label for="fromdate">From Date:</label>
      <input type="date" id="fromdate" name="fromdate" required>


      <label for="date">Date:</label>
      <input type="date" id="date" name="date" required>

      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required>
      
       <label for="days">Days:</label>
      <input type="text" id="days" name="days" required>


      <button type="submit" class="btn btn-primary btn-block">Add Holiday</button>
    </form>
  
    
  </div>
  </main>

  
</body>
</html>
