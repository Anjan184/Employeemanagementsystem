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

.container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
    }

    form div {
      margin-bottom: 15px;
    }

    label {
      display: block;
      font-weight: bold;
    }

    input[type="date"],
    select,
    textarea {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button[type="submit"] {
      display: block;
      width: 100%;
      padding: 10px;
      font-size: 16px;
      color: #fff;
      background-color: #007bff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    button[type="submit"]:hover {
      background-color: #0056b3;
    }
    
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
    
    h2 {
      text-align: center;
    }
    
    .fm {
            width: 90%;
            margin: 0 auto; /* Center the form horizontally */
            padding: 20px;
            border: 1px groove black;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
         button[type="submit"] {
      display: block;
      width: 50%;
      padding: 10px;
      font-size: 16px;
      color: #fff;
      background-color: #007bff;
      border: none;
      border-radius: 20px;
      cursor: pointer;
      margin:0 auto;
    }

    button[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>



</head>

<body>
 
 <%@include file="./Navemp.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Edit Leave Application</h1>
      <nav>
        <ol class="breadcrumb">
         <li class="breadcrumb-item">Leave Management</li>
					<li class="breadcrumb-item"><a href="employee_leave">Leave Application</a></li>
					<li class="breadcrumb-item Active">Edit Leave Application</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
	 <div class="container">
        <form action="process_leave" method="post" class="fm">
		 <h2>Edit Leave</h2>
        
        <label for="leave_Id"></label>
      <input type="hidden" id="leave_Id" value="${leave.leave_Id}" name="leave_Id" required>
        
          <div>
            <label for="from_Date">From Date:</label>
            <input type="date" id="from_Date" name="from_Date" value="${leave.from_Date}" required>
          </div>
          
          <div>
            <label for="to_Date">To Date:</label>
            <input type="date" id="to_Date" name="to_Date" value="${leave.to_Date}" required>
          </div>
          
          <div>
            <label for="leave_type">Leave Type:</label>
            <select id="leave_type" name="leave_type" required>
              <option value="sick">Sick Leave</option>
              <option value="vacation">Vacation Leave</option>
              <option value="marriage">Marriage leave</option>
              <option value="other">Other reason</option>
            </select>
          </div>
          
          <div>
            <label for="reason">Reason:</label>
            <textarea id="reason" name="reason" rows="4"required>${leave.reason}</textarea>
          </div>
         
         <input type="hidden" id="status" name="status" value="Pending">
         
          <button type="submit">Submit</button>
        </form>
      </div>

    </section>

  </main>



</body>

</html>