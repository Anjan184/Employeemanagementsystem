<%@page import="ems.entities.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Profile</title>
<meta content="" name="description">
<meta content="" name="keywords">

<%@include file="./base.jsp"%>


</head>

<body>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>ESS</title>
<meta content="" name="description">
<meta content="" name="keywords">
<style>
.profile {
	padding: 30px;
}

/* Profile card styles */
.profile-card {
	text-align: center;
}

/* Profile name styles */
.profile-card h2 {
	margin-bottom: 5px;
	color: #333; /* Dark text color */
}

/* Profile position styles */
.profile-card h3 {
	margin-bottom: 20px;
	color: #666; /* Medium dark text color */
}

/* Overview section styles */
.profile-overview {
	padding-top: 20px;
}

/* Label styles */
.label {
	font-weight: bold;
	color: #777; /* Medium light text color */
}

/* Details styles */
.details {
	color: #555; /* Medium text color */
	margin-bottom: 10px;
}

/* Navigation tabs styles */
.nav-tabs-bordered .nav-link {
	border: none;
	background-color: transparent;
	color: #333; /* Dark text color */
	border-bottom: 2px solid transparent;
}

/* Active tab styles */
.nav-tabs-bordered .nav-link.active {
	color: #007bff; /* Blue text color */
	border-bottom-color: #007bff; /* Blue border color */
}

.punch-btn {
	display: block;
	width: 80%;
	padding: 8px;
	margin-bottom: 10px;
	border: none;
	margin-left: 8px;
	cursor: pointer;
	font-size: 16px;
	text-align: center;
	color: #fff;
	border-radius: 30px;
}

.punch-in-btn {
	background-color: green;
}

.punch-out-btn {
	background-color: red;
}
</style>
</head>

<body>
	
	<%@include file="./Navemp.jsp" %>


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Profile</h1>
			<nav>
				<ol class="breadcrumb">
				
					<li class="breadcrumb-item">Details</li>
					<li class="breadcrumb-item active">Profile</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section profile">
			<div class="row">
				<div class="col-xl-4">

					<div class="card">
						<div
							class="card-body profile-card pt-4 d-flex flex-column align-items-center">

							<img src="data:profilePicture/jpeg;base64,<%=session.getAttribute("img")%>"  width="150" height="130" alt="Profile" class="rounded-circle">
							
							<h2>${currentUser.fullname}</h2>
							<h3>${currentUser.position}</h3>

						</div>
					</div>

				</div>

				<div class="col-xl-8">

					<div class="card">
						<div class="card-body pt-3">
							<!-- Bordered Tabs -->
							<ul class="nav nav-tabs nav-tabs-bordered">

								<li class="nav-item">
									<button class="nav-link active" data-bs-toggle="tab"
										data-bs-target="#profile-overview">Overview</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-edit">Edit Profile</button>
								</li>
							</ul>

							<div class="tab-content pt-2">

								<div class="tab-pane fade show active profile-overview"
									id="profile-overview">


									<div class="row">
										<div class="col-lg-3 col-md-4 label ">Full Name</div>
										<div class="col-lg-9 col-md-8">${currentUser.fullname}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Company</div>
										<div class="col-lg-9 col-md-8">DRC Systems</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Position</div>
										<div class="col-lg-9 col-md-8">${currentUser.position}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Address</div>
										<div class="col-lg-9 col-md-8">${currentUser.address}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Gender</div>
										<div class="col-lg-9 col-md-8">${currentUser.gender}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Phone</div>
										<div class="col-lg-9 col-md-8">${currentUser.contact}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Email</div>
										<div class="col-lg-9 col-md-8">${currentUser.email}</div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Blood Group</div>
										<div class="col-lg-9 col-md-8">${currentUser.bloodgroup}</div>
									</div>


								</div>


							</div>
							<!-- End Bordered Tabs -->

						</div>


						<div class="tab-content pt-2">
							<div class="tab-pane fade show profile-edit pt-2" id="profile-edit">


								<form action="editprofile" method="post" enctype="multipart/form-data" >


								<div class="row mb-3">
							        <label class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
							        <div class="col-md-8 col-lg-9">
							            <input type="file" name="profilePicture" id="profilePicture" class="form-control" >
							        </div>
							    </div> 
																		
									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Full
											Name</label>
										<div class="col-md-8 col-lg-9">
											<input name="fullname" type="text" class="form-control"
												id="fullname" value="${currentUser.fullname}">
										</div>
									</div>


									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Address</label>
										<div class="col-md-8 col-lg-9">
											<input name="address" type="text" class="form-control"
												id="address" value="${currentUser.address}">
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Phone</label>
										<div class="col-md-8 col-lg-9">
											<input name="contact" type="text" class="form-control"
												id="contact" value="${currentUser.contact}">
										</div>
									</div>

									<div class="row mb-3">
										<label  class="col-md-4 col-lg-3 col-form-label">Gender</label>
										<div class="col-md-8 col-lg-9">
											<select name="gender" class="form-select">
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select>
										</div>
									</div>


									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Email</label>
										<div class="col-md-8 col-lg-9">
											<input name="email" type="email" class="form-control"
												id="email" value="${currentUser.email}">
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">New
											Password</label>
										<div class="col-md-8 col-lg-9">
											<input name="password" type="password" class="form-control"
												id="password" value="${currentUser.password}">
										</div>
									</div>
									
									<div class="row mb-3">
										<label  class="col-md-4 col-lg-3 col-form-label">BloodGroup</label>
										<div class="col-md-8 col-lg-9">
											<select name="bloodgroup" class="form-select">
												<option value="A+">A+</option>
												<option value="A-">A-</option>
												<option value="B+">B+</option>
												<option value="B-">B-</option>
												<option value="AB+">AB+</option>
												<option value="AB-">AB-</option>
												<option value="O+">O+</option>
												<option value="O-">O-</option>
											</select>
										</div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">Save
											Changes</button>
									</div>

								</form>
								<!-- End Profile Edit Form -->

							</div>
						</div>
					</div>

				</div>

			</div>
		</section>

	</main>
	<!-- End #main -->

</body>

</html>