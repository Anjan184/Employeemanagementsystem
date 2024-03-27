<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@include file="./base.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Edit Details</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
    }
    form {
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 80%;
      max-width: 1200px;
      margin-top:250px;
  
    }
    .employee-table {
      width: 100%;
      border-collapse: collapse;
    }
    .employee-table th, .employee-table td {
      padding: 10px;
      border-bottom: 1px solid #ddd;
    }
    .employee-table th {
      background-color: #f2f2f2;
      font-weight: bold;
    }
    .employee-table td input[type="text"] {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 3px;
      box-sizing: border-box;
    }
    .employee-table td input[type="text"]:focus {
      border-color: #007bff;
      outline: none;
    }
    .center-align {
      text-align: center;
    }
    .center-align button {
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .center-align button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<form action="/ems/change_details/${employee.id}" method="post">

    <table class="employee-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Position</th>
                <th>Blood Group</th>
                <th>Role</th>
                <th>address</th>
                
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="text" name="fullname" value="${employee.fullname}" /></td>
                <td><input type="text" name="contact" value="${employee.contact}" /></td>
                <td><input type="text" name="email" value="${employee.email}" /></td>
                <td><input type="text" name="gender" value="${employee.gender}" /></td>
                <td><input type="text" name="position" value="${employee.position}" /></td>
                <td><input type="text" name="bloodgroup" value="${employee.bloodgroup}" /></td>
                <td><input type="text" name="role" value="${employee.role}" /></td>
                <td><input type="text" name="address" value="${employee.address}" /></td>
            </tr>
        </tbody>
    </table>
    <br>
    <div class="center-align">
       <button type="submit">Save details</button>
    </div>
 
</form>
</body>
</html>
