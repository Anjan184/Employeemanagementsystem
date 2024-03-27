<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="./base.jsp"%>

<title>Login page</title>
<style>

 body {
    background-image: url("resources/assets/img/5172658.jpg");
    background-size: cover;
    background-position: center; 
    
} 

form {

	
    width: 300px;
    margin: 0 auto;

 
  	
  
}

.logo-container {
    display: flex;
    align-items: center; /* Align items vertically */
    justify-content: center; /* Center items horizontally */
    margin-bottom: 10px;
}
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

.lgn{
margin-top:190px;

}

.login-text{
margin-bottom:30px;
text-align:center;
font-weight:bold;
font-size: 30px;
color:white;
}

.logo-img{
    width: 24px; /* Adjust the width of the image */
    height: auto; /* Maintain aspect ratio */
    margin-right: 10px; /* Add space between the logo and ESS */
}
.mail{
color:white;
}

.pass{
color:white;

}

.rl{
color:white;
}
.d-none.d-lg-block {
    color: white; 
    font-weight: bold;
}


</style>
</head>
<body>

	<form action="Dashboard" method="post">
        
          <div class="lgn"> 
             <div class="logo-container">
            <img src="resources/assets/img/logo.png" alt="Logo" class="logo-img">
            <span class="d-none d-lg-block">ESS</span>
        </div>
        <span class="login-text d-none d-lg-block">Login</span>
        
        <label for="email" class="mail">Username:</label>
        <input type="email" name="email" id="email" required>
        <br>
        <label for="password" class="pass">Password :</label>
        <input type="password" name="password" id="password" required>
        
        <br>


        <label for="role"  class="rl">Select Role:</label>
        <select  name="role" id="role" required>
            <option value="admin">Admin</option>
            <option value="employee">Employee</option>
        </select>

        <br>

        <button type="submit">Login</button>
    </div>
    </form>
    
   <c:if test="${not empty error}">
    <c:out value="${error}" />
	</c:if>
        
</body>
</html>