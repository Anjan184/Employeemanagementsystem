 <%@include file="./base.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Employee Registration</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
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
  <div class="container">
    <h2>Add new holiday</h2>
    
    <form action="add_holiday" method="post">

      <label for="fromdate">From Date:</label>
      <input type="date" id="fromdate" name="fromdate" required>

    
      <label for="date">Date:</label>
      <input type="date" id="date" name="date" required>

      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required>
      
       <label for="days">Days:</label>
      <input type="text" id="days" name="days" required>

    
      <button type="submit">Add Holiday</button>
    </form>
  </div>
</body>
</html>
