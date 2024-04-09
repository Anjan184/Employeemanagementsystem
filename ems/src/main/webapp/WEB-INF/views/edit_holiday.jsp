<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<%@include file="./base.jsp"%>
<title>Events</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>

  			body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        

        label {
            font-weight: bold;
        }

        input[type="date"],
        input[type="text"],
        input[type="time"] {
            width: 100%;
            padding: 8px;
            
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width:40%;
            margin-left:140px;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }
       .fm {
    width: 50%;
    margin-left: 250px;
    border: 1px groove black; /* Set border color to blue */
    border-radius: 10px; /* Add border-radius for rounded corners */
    padding: 20px; /* Add padding for better spacing */
}

  label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        /* Style the input */
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            /* Additional styles based on your preference */
            font-family: Arial, sans-serif;
            font-size: 14px;
            /* Add more styles as needed */
        }

        /* Style the input when focused */
        input[type="number"]:focus {
            border-color: #007bff;
            outline: none;
            /* Additional styles for focus */
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

</style>
</head>

<body>

<%@include file="./Navadmin.jsp"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Holidays</h1>
			<nav>
				<ol class="breadcrumb">
					
					<li class="breadcrumb-item ">Basic</li>
				 <li class="breadcrumb-item "><a href="Holidays">Holidays</a></li>
					<li class="breadcrumb-item active">Edit Holidays</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
		  <form action="add_holiday" method="post" class="fm">
    <h1 style="text-align:center">Edit Holiday</h1>
    
   	 <label for="id"></label>
      <input type="hidden" id="id" value="${hol.id}" name="id" required>
    
      <label for="fromdate">From Date:</label>
      <input type="date" id="fromdate" value="${hol.fromdate}" name="fromdate" required>
		
      <label for="date">To Date:</label>
      <input type="date" id="date" name="date" value="${hol.date}" required>
    
       <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="${hol.name}" required>
      
       <label for="days">Days:</label>
      <input type="number" id="days" name="days" value="${hol.days}" required>
      
      
    <br><br>
      <button type="submit" class="btn btn-primary btn-block">Save</button>
    </form>


		</section>

	</main>


</body>

</html>