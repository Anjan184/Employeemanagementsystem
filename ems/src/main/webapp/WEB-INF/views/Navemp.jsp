<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="employee_dashboard" class="logo d-flex align-items-center">
				<img src="resources/assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">ESS</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>

		</div>
		<!-- End Logo -->


		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item dropdown">
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="data:profilePicture/jpeg;base64,<%=session.getAttribute("img")%>"  width="40" height="50" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">${currentUser.fullname}</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>${currentUser.fullname}</h6> <span>${currentUser.position}</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="employee_profile"> <i class="bi bi-person"></i> <span>My
									Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>


						<li><a class="dropdown-item d-flex align-items-center"
							href="pages-faq"> <i class="bi bi-question-circle"></i> <span>Need
									Help?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="signout"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link "
				href="employee_dashboard"> <i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>Basic</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="employee_events"> <i class="bi bi-circle "
							style="text-decoration: none;"></i><span>Events</span>
					</a></li>
					<li><a href="employee_holidays"> <i class="bi bi-circle"></i><span>Holiday
								Schedule</span>
					</a></li>

				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i><span>Attendance</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="tables-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="employee_attendance"> <i class="bi bi-circle"></i><span>Daily
								attendance</span>
					</a></li>

				</ul></li>
			<!-- End Tables Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-house-door"></i><span>Leave Management</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>

				<ul id="icons-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="employee_leave"> <i class="bi bi-circle"></i><span>Leave
								Application</span>
					</a></li>

				</ul></li>
			<!-- End Icons Nav -->
			
			<li class="nav-item">
    <a class="nav-link collapsed" data-bs-target="#assign-tasks-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-check2-square"></i><span>Tasks</span><i class="bi bi-chevron-down ms-auto"></i>
    </a>
    <ul id="assign-tasks-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <li>
            <a href="employee_tasks">
                <i class="bi bi-circle"></i><span>Show Tasks</span>
            </a>
        </li>
    </ul>
</li><!-- End Tables Nav -->
			
		
			 <li class="nav-heading" style="text-align:center;font-size:15px;font-style:italic;"><b>Details</b></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="employee_profile"> <i class="bi bi-person"></i> <span>Profile</span>
			</a></li>
			<!-- End Profile Page Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				href="employee_contact"> <i class="bi bi-envelope"></i> <span>Contact</span>
			</a></li>
			<!-- End Contact Page Nav -->

			<br>
			
			
			
		

			<li class="nav-item"><a href="punchin"
				class="punch-btn punch-in-btn">Punch In</a></li>


			<li class="nav-item"><a href="punchout"
				class="punch-btn punch-out-btn">Punch Out</a></li>


		</ul>

	</aside>

	<script>
			function select(selector) {
				return document.querySelector(selector);
			}

			function on(event, element, callback) {
				document.addEventListener(event, function(e) {
					if (e.target.closest(element)) {
						callback(e);
					}
				});
			}

			if (select('.toggle-sidebar-btn')) {
				on('click', '.toggle-sidebar-btn', function(e) {
					const body = select('body');
					body.classList.toggle('toggle-sidebar');
					const icon = select('.toggle-sidebar-btn i');
					// Toggle icon based on body class
					if (body.classList.contains('toggle-sidebar')) {

						icon.classList.remove('bi-list');
						// Change to your desired icon when sidebar is toggled
					} else {
						icon.classList.remove('bi-x'); // Change to your desired icon when sidebar is not toggled
						icon.classList.add('bi-list');

					}
					e.preventDefault(); // Prevent default behavior of the anchor tag
				});
			}
		</script>