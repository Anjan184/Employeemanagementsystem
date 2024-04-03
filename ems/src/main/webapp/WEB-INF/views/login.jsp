<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="./base.jsp"%>

<title>Login page</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> <!-- Include Bootstrap CSS -->
<style>

body {
    background-image:url("resources/assets/img/top-view.jpg");
    font-family: Arial, sans-serif;
    background-size:cover;
    background-position:center;
    margin: 0;
    padding: 0;
     height: 100vh; /* Set body height to viewport height */
    overflow: hidden;
}

.lgn {
    width: 350px;
    margin: 80px auto; /* Center the form horizontally */
    padding: 10px;
    height:380px;;
    border: none; /* Remove border */
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.6); /* Set background color with transparency */
    
}

.logo-container {
    display: flex;
    align-items: center;
    justify-content: right;
    margin-top:-2 %;
	margin-right:25px;
}

select, input[type="email"], input[type="password"]{
    width: 80%;
    margin-left:33px;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}



button {
    width: 60%;
  
    margin-left:64px;
    background-color: #007bff;
    color: #fff;

    border-radius: 70px;
    cursor: pointer;
      /* Center the button horizontally */
  
   
}

button:hover {
    background-color: #0056b3;
}

.login-text {
    margin-bottom: 30px;
    text-align: center;
    font-weight: bold;
    font-size: 24px;
    color: #333;
}

.logo-img {
    width: 37px;
    height: auto;
    margin-right: 8px;
}

.rl {
    color: #333;
text-align:center;

}

.role{
width:80%;
border-radius:5px;
}


</style>
</head>
<body>
<div class="logo-container">
        <img src="resources/assets/img/logo.png" alt="Logo" class="logo-img">
        <span class="d-none d-lg-block" style="font-size:60px;"><b>ESS</b></span>
    </div>
    

<form action="Dashboard" method="post" class="lgn">
    
    <span class="login-text d-none d-lg-block">Login Here</span>
    
    <label for="email" class="mail col-8 text-right font-weight-bold">Username</label>
    <br>
    <input type="email" name="email" id="email" class="form-control" placeholder="Enter Username" required> <!-- Add Bootstrap form-control class -->
    <br>
    <label for="password" class="pass col-8 text-right font-weight-bold">Password</label>
    <br>
    <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password" required> <!-- Add Bootstrap form-control class -->
    
    <br>

    <button type="submit" class="btn btn-primary" style="border-radius:50px;">Login</button> <!-- Add Bootstrap btn and btn-primary classes -->
</form>

<!-- Display error message -->
<c:if test="${not empty error}">
    <div class="alert" role="alert">
        ${error}
    </div>
</c:if>

</body>
</html>
