<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
 <%@include file="./base.jsp" %>
  <title>Attendance</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<style>
.attendance-table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

.attendance-table th, .attendance-table td {
	padding: 8px;
	border: 1px solid #ddd;
	text-align: center;
}

.attendance-table th {
	background-color: #f2f2f2;
}

.attendance-table tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}

.attendance-table tbody tr:hover {
	background-color: #ddd;
}

.attendance-table th {
	font-size: 14px; /* Adjust font size */
	color: #333; /* Darker text color */
	border: 1px solid #ccc; /* Lighter border color */
}

/* Additional styling for table rows */
.attendance-table td {
	font-size: 14px; /* Adjust font size */
	color: #555; /* Dark gray text color */
	border: 1px solid #ccc; /* Lighter border color */
}

/* Styling for hover effect */
.attendance-table tbody tr:hover td {
	background-color: #e2e2e2; /* Light gray background on hover */
}

.attendance-table td a {
	display: inline-block;
	padding: 8px 12px;
	background-color: #007bff; /* Blue background color */
	color: #fff; /* White text color */
	text-decoration: none; /* Remove default underline */
	border-radius: 4px; /* Rounded corners */
	transition: background-color 0.3s ease;
	/* Smooth transition on hover */
}

.attendance-table td a:hover {
	background-color: #0056b3; /* Darker blue on hover */
}

</style>
</head>

<body>


  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Attendance</h1>
      
    </div><!-- End Page Title -->

    <section class="section">

			<table class="attendance-table">
				<thead>
					<tr>
						<th>User Id</th>
						<th>Date</th>
						<th>First In</th>
						<th>Last Out</th>				
					</tr>
				</thead>
				<tbody>
					<tbody>
    <c:forEach items="${showFirstAdmin}" var="showFirst" varStatus="loop">
        <tr>
            <td>${showFirst.getUser().getId()}</td>
            <td>${showFirst.getPunchIn_Date()}</td>
            <td>${showFirst.getPunchIn()}</td>
            <td>${showLastAdmin[loop.index].getPunchOut()}</td> <!-- Assuming showLastAdmin is the corresponding list for punch out times -->
        </tr>
    </c:forEach>
</tbody>
				</tbody>

			</table>
    </section>

  </main><!-- End #main -->

    	<script>

	 function select(selector) {
	        return document.querySelector(selector);
	    }

	    function on(event, element, callback) {
	        document.addEventListener(event, function (e) {
	            if (e.target.closest(element)) {
	                callback(e);
	            }
	        });
	    }

	    if (select('.toggle-sidebar-btn')) {
	        on('click', '.toggle-sidebar-btn', function (e) {
	            const body = select('body');
	            body.classList.toggle('toggle-sidebar');
	            const icon = select('.toggle-sidebar-btn i');
	            // Toggle icon based on body class
	          
	            e.preventDefault(); // Prevent default behavior of the anchor tag
	        });
	    }
</script>
  

  

</body>

</html>