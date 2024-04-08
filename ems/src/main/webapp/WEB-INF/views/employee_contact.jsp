<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<%@include file="./base.jsp" %>
  <title>ESS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<style>

.punch-btn {
      display: block;
      width: 80%;
      padding: 8px;
      margin-bottom: 10px;
      border: none;
      margin-left:8px;
      cursor: pointer;
      font-size: 16px;
      text-align: center;
      color: #fff;
      border-radius:30px;
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
      <h1>Contact</h1>
      <nav>
        <ol class="breadcrumb">
     
          <li class="breadcrumb-item">Details</li>
          <li class="breadcrumb-item active">Contact</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section contact">

      <div class="row gy-4">

        <div class="col-xl-8">

          <div class="row">
            <div class="col-lg-7">
              <div class="info-box card">
                <i class="bi bi-geo-alt"></i>
                <h3>Address</h3>
                <span>DRC Systems India Limited. 24th Floor, GIFT Two Building, Block No.56, Road–5C , Zone–5, GIFT CITY, Gandhinagar, Taluka & District–Gandhinagar–382 355 Gujarat, India</span></div>
            </div>
            <div class="col-lg-5">
              <div class="info-box card">
                <i class="bi bi-telephone"></i>
                <h3>Call Us</h3>
                <p>+91 79 6777 2222</p>
              </div>
            </div>
            <div class="col-lg-7">
              <div class="info-box card">
                <i class="bi bi-envelope"></i>
                <h3>Email Us</h3>
                <p>info@drcsystems.com</p>
              </div>
            </div>
            <div class="col-lg-5">
              <div class="info-box card">
                <i class="bi bi-clock"></i>
                <h3>Open Hours</h3>
                <p>Monday - Friday<br>10:30AM - 06:30PM</p>
              </div>
            </div>
          </div>

        </div>



      </div>

    </section>

  </main><!-- End #main -->


</body>

</html>