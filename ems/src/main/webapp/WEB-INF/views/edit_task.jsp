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
       .fm {
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
			<h1>Tasks</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Tasks</li>
					<li class="breadcrumb-item ">Assign Tasks</li>
					<li class="breadcrumb-item active">Edit Task</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
		
		  <form action="add_button" method="post" class="fm">
		
		 <label for="task_id"></label>
      <input type="hidden" id="task_id" value="${task.task_id}" name="task_id" required>
		
         <div>
            <label for="task_name">Task Name</label>
            <input type="text" id="task_name" name="task_name" value="${task.task_name }" required>
          </div>
          
          <div>
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" required>${task.description}</textarea>
          </div>
          
          <div>
        <label for="assignedTo">Assign Task To:</label>
        <select id="assignedTo" name="assignedTo" required>
            <c:forEach items="${empids}" var="employee">
                <option value="${employee.fullname}">${employee.fullname}</option>
            </c:forEach>
        </select>
   		 </div>
          
         <div>
            <label for="due_date">Due Date:</label>
            <input type="date" id="due_date" name="due_date" value="${task.due_date}" required>
          </div>
         
         <input type="hidden" id="status" name="status" value="${task.status }">
         
          <button type="submit">Submit</button>
        </form>


		</section>

	</main>
	

</body>

</html>