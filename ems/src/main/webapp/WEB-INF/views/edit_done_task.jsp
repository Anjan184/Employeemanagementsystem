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
    <!-- Bootstrap CSS -->
   
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .fm {
            width: 50%;
            margin: 0 auto; /* Center the form horizontally */
            padding: 20px;
            border: 1px groove black;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
    <%@include file="./Navadmin.jsp"%>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Edit Done Progress Tasks</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                   <li class="breadcrumb-item">Projects</li>
					<li class="breadcrumb-item"><a href="Inprogress_Project">Done Project</a></li>
					<li class="breadcrumb-item Active">Done Tasks</li>
					<li class="breadcrumb-item Active">Edit Done Tasks</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section dashboard">
         <h1 style="text-align: center;">Edit Done Tasks</h1>
            <form action="add_button" method="post" class="fm">
                <input type="hidden" id="task_id" value="${task.task_id}" name="task_id" required>

                <div class="mb-3">
                    <label for="task_name" class="form-label">Task Name</label>
                    <input type="text" id="task_name" name="task_name" value="${task.task_name}" class="form-control"
                        required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Description:</label>
                    <textarea id="description" name="description" rows="4" class="form-control"
                        required>${task.description}</textarea>
                </div>

                <div class="mb-3">
                    <label for="assignedTo" class="form-label">Assign Task To:</label>
                    <select id="assignedTo" name="assignedTo" class="form-select" required>
                        <c:forEach items="${empids}" var="employee">
                            <option value="${employee.fullname}">${employee.fullname}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="due_date" class="form-label">Due Date:</label>
                    <input type="date" id="due_date" name="due_date" value="${task.due_date}" class="form-control"
                        required>
                </div>

                <input type="hidden" id="status" name="status" value="${task.status}">
				<input type="hidden" id="project_id" name="project_id" value="${task.project.project_id}">
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </section>
    </main>

</body>

</html>
