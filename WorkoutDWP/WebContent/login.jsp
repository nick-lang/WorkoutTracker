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

<!-- Acknowledgements:
   ==================================================
   1. Template: Designed by Tooplate (Pure Mix 6 pages)
   2. Bootstrap Navbar on Mobile:
   		a. Ref #1: http://stackoverflow.com/questions/20863288/bootstrap-3-slide-in-menu-navbar-on-mobile
   		b. Ref #2: https://github.com/iamphill/Bootstrap-Offcanvas
-->

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
   <div id="slidemenu">

    <ul class="nav navbar-nav">
     <li class="active"><a href="http://www.safercar.gov/CheckForRecalls" target="_blank">Recalls</a></li>
                        <li><a href="https://tiresize.com/how-to-read-tire-size/">How to Read Tire Size</a></li>
                        <li><a href="https://tiresize.com/calculator/">Tire Calculator</a></li>
                        <li><a href="https://tiresize.com/comparison/">Tire Size Comparison</a></li>
     <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tire Performance Categories <b class="caret"></b></a>
      <ul class="dropdown-menu">
       <li class="dropdown-header">Summer Passenger</li>
       <li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=EP" >Extreme Performance Summer</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=MP" >Max Performance Summer</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=UHP" >Ultra High Performance Summer</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=HP" >High Performance Summer</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=GT" >Grand Touring Summer</a></li>
       <li class="divider"></li>
       <li class="dropdown-header">All-Season Passenger Tires</li>
       <li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=UHPAS" >Ultra High Performance All-Season</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=HPAS" >High Performance All-Season</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=PAS" >Performance All-Season</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=GTAS" >Grand Touring All-Season</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=ST" >Standard Touring All-Season</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=AS" >Passenger All-Season</a></li>
       <li class="divider"></li>
       <li class="dropdown-header">Winter / Snow Passenger Tires</li>
       <li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=PSIS" >Studless Ice & Snow</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=PSW" >Studdable Winter / Snow</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=PPW" >Performance Winter / Snow</a></li>
       <li class="divider"></li>
       <li class="dropdown-header">Track & Competition DOT Tires</li>
       <li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=UHPAS" >Ultra High Performance All-Season</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=DRY" >Racetrack & Autocross Only</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=WET" >Wet Racetrack & Autocross Only</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=STRT" >Streetable Track & Competition</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=DRAG" >Drag Racing Radials</a></li>
       <li class="divider"></li>
       <li class="dropdown-header">Summer Light Truck/SUV Tires</li>
       <li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=PSIS" >Studless Ice & Snow</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=SST" >Street/Sport Truck Summer</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=HR" >Highway Rib Summer</a></li>
       <li class="divider"></li>
       <li class="dropdown-header">All-Season Light Truck/SUV Tires</li>
       <li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=SSTAS" >Street/Sport Truck All-Season</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=CSTAS" >Crossover/SUV Touring All-Season</a></li>
											<li><a href="http://www.tirerack.com/tires/types/perfCat.jsp?perf=HAS" >Highway All-Season</a></li>
      </ul>
     </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
          <li><a href="https://www.google.com/maps/" target="_blank">Google Maps</a></li>
          <li><a href="https://vpic.nhtsa.dot.gov/" target="_blank">NHTSA</a></li>
          <li><a href="https://www.weather.com/maps/" target="_blank">TWC</a></li>
    </ul>

   </div>
  </div>
 </div>
	</header>

	<!-- Header section
================================================== -->
	<section id="header" class="header-one">
	<div class="container">
		<div class="row">

			<div class="col-md-offset-0 col-sm-6 col-sm-offset-0 col-sm-6">
				<div class="header-thumb wow lightSpeedIn lightSpeedOut"
					data-wow-delay="1.6s">
					<h1 class="wow lightSpeedIn lightSpeedOut" data-wow-delay="0.6s">There's
						a tire for every occasion</h1>
				</div>
				</br>
				<div class="header-thumb wow lightSpeedIn lightSpeedOut"
					data-wow-delay="3.0s">
					<h1 class="wow lightSpeedIn lightSpeedOut" data-wow-delay="2.0s">Let's
						ride</h1>
				</div>
			</div>

		</div>
	</div>
	</section>


	<!-- Portfolio section
================================================== -->

	<section id="portfolio">
	<div class="container">
		<div class="row">

			<div class="col-md-12 col-sm-12">

				<!-- iso section -->
               <div class="iso-section wow fadeInUp" data-wow-delay="2.6s">
			<div class="table-responsive">
			<table class="table table-striped table-hover">
               <tr>
                           <td><a ><form action="GetDealerList.do" method="GET">
           				   <a><input class="btn btn-primary" type="submit" value="View Dealer List" /></a>
                           </form></a></td>
                           <td><a ><form action="GetDealerInfo.do" method="GET">
           				   <a><input class="btn btn-primary" type="submit" value="Get Dealer Info" /></a>
                           </form></a></td>
                           <td><a ><form action="AddDealer.do" method="GET">
           				   <a><input class="btn btn-primary" type="submit" value="Add New Dealer" /></a>
                           </form></a></td>
               </tr>
               </table>

                        <!-- iso box section -->
					<div class="iso-box-section wow fadeInUp" data-wow-delay="1s">
						<div class="iso-box-wrapper col4-iso-box">

							<div class="iso-box photoshop branding col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img src="images/portfolio-img1.jpg" class="img-responsive"
										alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="getAllSeason.do"><i class="fa fa-link"></i></a>
											<h2>All Season</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box graphic template col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img src="images/portfolio-img2.jpg" class="img-responsive"
										alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="getWinter.do"><i class="fa fa-link"></i></a>
											<h2>Winter</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box template graphic col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img src="images/portfolio-img3.jpg" class="img-responsive"
										alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="getPerformance.do"><i class="fa fa-link"></i></a>
											<h2>Performance</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box graphic template col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img src="images/portfolio-img4.jpg" class="img-responsive"
										alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="getHighPerformance.do"><i class="fa fa-link"></i></a>
											<h2>High Performance</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box photoshop branding col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img src="images/portfolio-img5.jpg" class="img-responsive"
										alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="getLightTruck.do"><i class="fa fa-link"></i></a>
											<h2>Light Truck</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box graphic branding col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img src="images/portfolio-img6.jpg" class="img-responsive"
										alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="getTouring.do"><i class="fa fa-link"></i></a>
											<h2>Touring</h2>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
	</section>

	<!-- Footer section
================================================== -->
	<footer>
	<div class="container">
		<div class="row">

			<div class="col-md-12 col-sm-12">
				<p class="wow fadeInUp" data-wow-delay="0.3s">Copyright © 2016
					rodhammond.info - Designed by Tooplate</p>
			</div>

		</div>
	</div>
	</footer>


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