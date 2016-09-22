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
                <div class="navbar-header" ß>
                    <a class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                </div>

                <body class="userscreen_bg">
                    <div class="container">
                        <div class="row">
                            <div class="modal-content">

                                <form method="GET" action="CreateNewUser.do">
                                <div class="modal-header">
                                    <button style="color:red" type="input" name="close" lass="close" data-dismiss="modal"><i class="fa fa-times"></i></button>
                                    <h1><a class="navbar-brand" href="index.html">Workout Tracker</a></h1>
                                    <h4 class="modal-title" style="text-align: center">Create a New Account!</h4>
                                </div>
                                </form>

                                <form method="POST" action="CreateNewUser.do">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="firstName">First name</label>
                                                    <input type="text" class="form-control" required="" name="firstName" placeholder="" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="lastName">Last name</label>
                                                    <input type="text" class="form-control" required="" name="lastName" value="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address and Street</label>
                                            <input type="text" class="form-control" required="" name="address" placeholder="" />
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="address2">Suite / Box / Appartment </label>
                                                    <input type="text" class="form-control" name="address2" placeholder="" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="city">City</label>
                                                    <input type="text" class="form-control" required="" name="city" placeholder="" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="city">State</label>
                                                    <input type="text" class="form-control" required="" name="state" placeholder="" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="city">Zip</label>
                                                    <input type="text" class="form-control" required="" name="zip" placeholder="" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="email">Email Address</label>
                                                    <input type="text" class="form-control" required="" name="email" placeholder="" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="phone">Phone</label>
                                                    <input type="text" class="form-control" required="" name="phone" placeholder="" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="gender">Gender</label>
                                                    <input type="text" class="form-control" required="" name="gender" placeholder="M / F / Other" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="age">Age</label>
                                                    <input type="text" class="form-control" required="" name="age" placeholder="" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="height">Height</label>
                                                    <input type="text" class="form-control" required="" name="height" placeholder="inches" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="weight">Weight</label>
                                                    <input type="text" class="form-control" required="" name="weight" placeholder="lbs" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="username">User name</label>
                                            <input type="text" class="form-control" required="" name="username" placeholder="" />
                                            <span class="help-block">Choose a login name for your new account.</span>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="password">Password</label>
                                                    <input type="password" class="form-control" required="" name="password" value="">
                                                    <span class="help-block">Choose a password for your new account.</span>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="passwordr">Repeat Password</label>
                                                    <input type="password" class="form-control" required="" name="passwordr" value="">
                                                    <span class="help-block">Type the password again. Passwords must match.</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="modal-footer">
                                                <input type="hidden" name="isEmpty" value="">
                                                <button type="input" name="submit" value="newAccount" class="btn btn-success btn-icon"><i class="fa fa-check"></i> Create My Account</button>
                                            </div>
                                        </div>
                                    </div>
                    </form>
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
                </body>

                </html>