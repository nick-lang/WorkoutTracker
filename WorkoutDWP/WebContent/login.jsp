<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">

<title>Workout Tracker</title>

<!-- Bootstrap CSS
   ================================================== -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Animate CSS
   ================================================== -->
<link rel="stylesheet" href="css/animate.min.css">

<!-- Font Icons CSS
   ================================================== -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/ionicons.min.css">

<!-- Main CSS
   ================================================== -->
<link rel="stylesheet" href="css/bootstrap.offcanvas.min.css">
<link rel="stylesheet" href="css/bootstrap.offcanvas.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="myStyles.css">

<!-- Google web font 
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300' rel='stylesheet' type='text/css'>
Adding OSX wget function:
	wget alias:
	function _wget() { curl "${1}" -o $(basename "${1}") ; };
	alias wget='_wget'
	_wget https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300 font-google.css
<or>
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install wget --with-libressl
	wget https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300
	mv css\?family\=Source+Sans+Pro\:400\,700\,300 font-google.css
   ================================================== -->
<link rel='stylesheet' href="css/font-google.css">


</head>
<body class="body-offcanvas">


	<!-- Preloader section
================================================== -->
	<div class="preloader">

		<div class="sk-spinner sk-spinner-pulse"></div>

	</div>


	<!-- Navigation section
================================================== -->
	<header class="clearfix">
<div class="navbar navbar-default" role="navigation">
  <div class="container">
   <div class="navbar-header">
    <a class="navbar-toggle"> 
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
     </a>
    <h1><a class="navbar-brand wow lightSpeedIn" data-wow-delay="4.5s" href="index.html">Workout Tracker</a></h1>
   </div>
<div id="fullscreen_bg" class="fullscreen_bg"/>

<div class="container">

	<form class="form-signin">
		<h1 class="form-signin-heading text-muted">Sign In</h1>
		<input type="text" class="form-control" placeholder="Email address" required="" autofocus="">
		<input type="password" class="form-control" placeholder="Password" required="">
		<button class="btn btn-lg btn-primary btn-block" type="submit">
			Sign In
		</button>
	</form>

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

</body>
</html>