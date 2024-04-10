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
        
        /* Styling for the task name input container */
div.task-input-container {
  margin-bottom: 15px; /* Add margin below the container */
}

/* Styling for the label */
label {
  display: block; /* Make the label display as a block element */
  font-weight: bold; /* Make the label bold */
  margin-bottom: 5px; /* Add some space below the label */
}


input[type="text"] {
  width: 100%; 
  padding: 10px; 
  font-size: 16px; 
  border: 1px solid #ccc; 
  border-radius: 5px; 
  box-sizing: border-box; 
}

   
  </style>



</head>

<body>
  <%@include file="./Navadmin.jsp"%>


  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Add new Task</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Tasks</li>
          <li class="breadcrumb-item"><a href="Admin_tasks">Assign Tasks</a></li>
          <li class="breadcrumb-item Active">Add new Task</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
	 <div class="container">
	 
        <form action="add_button" method="post" class="fm">
		<h1 style="text-align:center;">Add Task</h1>
         <div class="task-input-container">
            <label for="task_name">Task Name</label>
            <input type="text" id="task_name" name="task_name" placeholder="Enter Task" required>
          </div>
          
          <div>
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" placeholder="Enter Description" required></textarea>
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
            <input type="date" id="due_date" name="due_date" required>
          </div>
         
         <input type="hidden" id="status" name="status" value="Todo">
         
          <button type="submit">Add Task</button>
        </form>
      </div>

    </section>

  </main><!-- End #main -->




</body>

</html>