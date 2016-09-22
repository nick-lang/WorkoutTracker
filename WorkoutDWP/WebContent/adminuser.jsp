<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <html lang="en">
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <meta name="keywords" content="">
                    <meta name="description" content="">

                    <title>WorkOut Tracker</title>

                    <!-- Bootstrap CSS
   ================================================== -->
                    <link rel="stylesheet" href="css/bootstrap.min.css">
                    <link rel="stylesheet" href="css/bootstrap.css">

                    <!-- Animate CSS
   ================================================== -->
                    <link rel="stylesheet" href="css/animate.min.css">

                    <!-- Font Icons CSS
   ================================================== -->
   					<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                    <link rel="stylesheet" href="css/font-awesome.min.css">
                    <link rel="stylesheet" href="css/ionicons.min.css">

                    <!-- Main CSS
   ================================================== -->
                    <link rel="stylesheet" href="css/bootstrap.offcanvas.min.css">
                    <link rel="stylesheet" href="css/bootstrap.offcanvas.css">
                    <link rel="stylesheet" href="css/style.css">
                    <link rel="stylesheet" href="myStyles.css">

                    <!-- Google web font 
   ================================================== -->
                    <link rel='stylesheet' href="css/font-google.css">

                    <!-- Header section
================================================== -->

</head>
<div class="navbar-header">
    <a class="navbar-toggle"> 
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
     </a>
    <h1><a class="navbar-brand" href="index.html">Workout Tracker</a></h1>
   </div>
<body>


	<!-- Preloader section
================================================== -->
	<div class="preloader">

		<div class="sk-spinner sk-spinner-pulse"></div>

	</div>


	<!-- Navigation section
================================================== -->
<div class="navbar navbar-default" role="navigation">
<div id="fullscreen_bg" class="fullscreen_bg"/>
<div class="container">

	<h1 class="form-signin-heading" style="color: white">Administrator: Workout Tracker</h1>
	<!-- Code Here vv
================================================== -->
<div class="container">
    <div class="row">
        <div class="col-lg-5 col-md-12 col-sm-8 col-xs-9 bhoechie-tab-container">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 bhoechie-tab-menu">
              <ul class="list-group">
                <a href="#" class="list-group-item active">
                  <br/><br/><i class="glyphicon glyphicon-home"></i> Home<br/><br/>
                  </a>
                <a href="#" class="list-group-item ">
                  <br/><br/><i class="glyphicon glyphicon-tasks"></i> Users<br/><br/>
                </a>  
                <a href="#" class="list-group-item ">
                  <br/><br/><i class="glyphicon glyphicon-transfer"></i> Workouts<br/><br/>
                </a>
                <a href="#" class="list-group-item">
                  <br/><br/><h4 class="glyphicon glyphicon-edit"></h4> Exercises<br/><br/>
                </a>
              </ul>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 bhoechie-tab">
                <!-- flight section -->
                <div class="bhoechie-tab-content active">
                    <center>
                      <h1 class="glyphicon glyphicon-wrench" style="font-size:14em;color:#00001a"></h1>
                      <h2 style="margin-top: 0;color:#00001a">Welcome</h2>
                      <h3 style="margin-top: 0;color:#00001a">Administrator HomePage</h3>
                      <h2 style="margin-top: 0;color:#00001a"><a href="index.html" class="btn btn-sm btn-primary btn-block" role="button">Exit Session</a></h2>
                    </center>
                </div>
              
              
                <div class="bhoechie-tab-content">
                    <center>
                      <h1 class="glyphicon glyphicon-tasks" style="font-size:12em;color:#00001a"></h1>
                      <h3 style="margin-top: 0;color:#00001a">Customer Records</h3>
                      <h2 style="margin-top: 0;color:#00001a"><a href="GetUserList.do" class="btn btn-sm btn-primary btn-block" role="button">List Users</a></h2>
                      <h2 style="margin-top: 0;color:#00001a"><a href="newuser.jsp" class="btn btn-sm btn-primary btn-block" role="button">Create new User Profile</a></h2>
                      <h2 style="margin-top: 0;color:#00001a"><a href="" class="btn btn-sm btn-primary btn-block" role="button">Review User Workout</a></h2>
                    </center>
                </div>
    
               
                <div class="bhoechie-tab-content">
                    <center>
                      <h1 class="glyphicon glyphicon-transfer" style="font-size:12em;color:#00001a"></h1>
                      <h2 style="margin-top: 0;color:#00001a"><a href="" class="btn btn-sm btn-primary btn-block" role="button">List Workouts</a></h2>
                      <h2 style="margin-top: 0;color:#00001a"><a href="" class="btn btn-sm btn-primary btn-block" role="button">Update Workout Plans</a></h2>
                      <h2 style="margin-top: 0;color:#00001a"><a href="" class="btn btn-sm btn-primary btn-block" role="button">Create new Workout Plan</a></h2>
                    </center>
                </div>
                
                <div class="bhoechie-tab-content">
                    <center>
                      <h1 class="glyphicon glyphicon-edit" style="font-size:12em;color:#00001a"></h1>
                      <h2 style="margin-top: 0;color:#00001a"><a href="" class="btn btn-sm btn-primary btn-block" role="button">List Exercises</a></h2>
                      <h2 style="margin-top: 0;color:#00001a"><a href="" class="btn btn-sm btn-primary btn-block" role="button">Update Exercise Data</a></h2>
                      <h2 style="margin-top: 0;color:#00001a"><a href="" class="btn btn-sm btn-primary btn-block" role="button">Create new Exercise</a></h2>
                    </center>
                </div>
            </div>
        </div>
  </div>
  </div>

	<!-- Code Here ^^
================================================== -->

</div>
</div>
</div>
	<!-- Footer section
================================================== -->



	<!-- Javascript 
================================================== -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/isotope.js"></script>
	<script src="js/imagesloaded.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/bootstrap.offcanvas.min.js"></script>
	<script src="js/bootstrap.offcanvas.js"></script>
	<script>$(document).ready(function() {
	    $("div.bhoechie-tab-menu>ul.list-group>a").click(function(e) {
	        e.preventDefault();
	        $(this).siblings('a.active').removeClass("active");
	        $(this).addClass("active");
	        var index = $(this).index();
	        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
	        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
	    });
	});</script>

</body>
</html>