<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Error Page</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<%@include file="./base.jsp" %>
</head>

<body>

  <main>
    <div class="container">

      <section class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
       <h2>There Is Some Error</h2>
        <img src="resources/assets/img/not-found.svg" class="img-fluid py-4" alt="Page Not Found">
        <h5 style="width: 1000px;">${exception}</h5>
       
        <a class="btn" href="login">Back to Login</a>
        
      </section>

    </div>
  </main><!-- End #main -->

 

</body>

</html>