<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
 <%@include file="./base.jsp" %>
  <title>Leave Application</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<style>
.leave-table th, .leave-table td {
	padding: 10px;
	border: 1px solid #ddd;
}

.leave-table th {
	background-color: #f8f9fa;
	text-align: left;
	font-weight: bold;
}

.leave-table td {
	text-align: left;
}

 .leave-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
 
 .leave-table tbody tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  .leave-table tbody tr:nth-child(odd) {
    background-color: #ffffff;
  }

  .leave-table tbody tr:hover {
    background-color: #e2e2e2;
  }

  /* Additional styling for table header */

  .leave-table th {
    font-size: 14px; /* Adjust font size */
    color: #333; /* Darker text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Additional styling for table rows */

  .leave-table td {
    font-size: 14px; /* Adjust font size */
    color: #555; /* Dark gray text color */
    border: 1px solid #ccc; /* Lighter border color */
  }

  /* Styling for hover effect */

  .leave-table tbody tr:hover td {
    background-color: #e2e2e2; /* Light gray background on hover */
  }
  
</style>
</head>

<body>
     <%@include file="./Navadmin.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Leave Application</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Leave Management</li>
          <li class="breadcrumb-item active">Leave Application</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
    <table class="leave-table">
        <thead>
          <tr>
            <th>User_Id</th>
            <th>From Date</th>
            <th>To Date</th>
            <th>Leave Type</th>
            <th>Reason</th>
            <th>Status</th>
		    <th>Action</th>
                          
          </tr>
        </thead>
        <tbody>
       	<c:forEach items="${all}" var="allleave">
						<tr>
							<td>${allleave.user.id}</td>
							<td>${allleave.from_Date}</td>
							<td>${allleave.to_Date}</td>
							<td>${allleave.leave_type}</td>
							<td>${allleave.reason}</td>
							<td><c:choose>
									<c:when test="${allleave.status eq 'reject'}">
										<h5>
											<span class="badge bg-danger text-dark"> ${allleave.status }</span>
										</h5>
									</c:when>
									
									<c:when test="${allleave.status eq 'approve'}">
										<h5>
											<span class="badge bg-success"> ${allleave.status }</span>
										</h5>
									</c:when>
									 
									 <c:when test="${allleave.status eq 'Pending'}">
										<h5>
											<span class="badge bg-warning text-dark"> ${allleave.status }</span>
										</h5>
									</c:when>
									
								</c:choose></td>

							 <td>
                                    <form action="process_leave_approval/${allleave.leave_Id}" method="post">
                                      <button type="submit" name="status" value="approve" class="btn btn-success">Approve</button>
<button type="submit" name="status" value="reject" class="btn btn-danger">Reject</button>

                                    </form>
                                </td>
						</tr>
					</c:forEach>
        </tbody>
      </table>
      <br>
     
	
    
    </section>

  </main><!-- End #main -->


</body>

</html>