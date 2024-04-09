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
       .container {
    width: 50%;
    margin-left: 220px;
    border: 2px solid green; /* Set border color to blue */
    border-radius: 10px; /* Add border-radius for rounded corners */
    padding: 20px; /* Add padding for better spacing */
}
</style>
</head>

<body>


	<%@include file="./Navadmin.jsp"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Events</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item ">Basic</li>
					<li class="breadcrumb-item "><a href="Events">Events</a></li>
					<li class="breadcrumb-item active">Edit Events</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
		  <form action="add_new_event" method="post" class="container">
    <h1 style="text-align:center">Edit Event</h1>
   	 <label for="eventid"></label>
      <input type="hidden" id="eventid" value="${eve.eventid}" name="eventid" required>
    
      <label for="date">Date:</label>
      <input type="date" id="date" value="${eve.date}" name="date" required>
		
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="${eve.name}" required>
    
       <label for="time">Time:</label>
      <input type="time" id="time" name="time" value="${eve.time}" required>
    <br><br>
      <button type="submit" class="btn btn-primary btn-block">Save</button>
    </form>


		</section>

	</main>


</body>

</html>