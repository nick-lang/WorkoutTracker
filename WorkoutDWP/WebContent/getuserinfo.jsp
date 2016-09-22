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

    <title>TireDEX</title>

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
================================================== -->
    <link rel='stylesheet' href="css/font-google.css">

    <!-- Header section
================================================== -->
</head>

<body>
                  <div class="navbar-header">
                      <a class="navbar-toggle"> 
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      </a>
                      <h1><a class="navbar-brand" href="index.html">TireDEX</a></h1>
                      <br>
                      <h2 style="color: green"><b>Dealer Information</b></h2>
                      <form action="GetDealerInfo.do" method="POST">
            <select name="index">
                <c:forEach var="dealer" items="${dealers}">
                    <option value="${dealer.index}">${dealer.name}</option>
                </c:forEach>
                <input class="btn-sm" type="submit" value="Get Dealer" />
                <br>
                <br>
            </select>
        </form>
    </div>

    <div class="output">
        <br>
        <br>
        <br>
        <form:form modelAttribute="dealer">
            <table>
                <tr>
                    <td>
                        <form:input hidden="true" size="35" path="index" />
                    </td>
                    <td>
                        <form:errors hidden="true" size="35" path="index" />
                    </td>
                </tr>
                <tr>
                    <td>
                    	<b>Business Name:</b>
                    </td>
                    <td>
                        <form:input size="35" path="name" />
                    </td>
                    <td>
                        <form:errors size="35" path="name" />
                    </td>
                    <br>
                </tr>
                <tr>
                    <td>
                    	<b>Address:</b>
                    </td>
                    <td>
                        <form:input size="35" path="address" />
                    </td>
                    <td>
                        <form:errors size="35" path="address" />
                    </td>
                </tr>
                <tr>
                    <td>
                    	<b>City:</b>
                    </td>
                    <td>
                        <form:input size="35" path="city" />
                    </td>
                    <td>
                        <form:errors size="35" path="city" />
                    </td>
                </tr>
                <tr>
                    <td>
                    	<b>State:</b>
                    </td>
                    <td>
                        <form:input size="35" path="state" />
                    </td>
                    <td>
                        <form:errors size="35" path="state" />
                    </td>
                </tr>
                <tr>
                    <td>
                    	<b>Zip Code:</b>
                    </td>
                    <td>
                        <form:input size="35" path="zip" />
                    </td>
                    <td>
                        <form:errors path="zip" />
                    </td>
                    <br>
                </tr>
                <tr>
                    <td>
                    	<b>Phone:</b>
                    </td>
                    <td>
                        <form:input size="35" path="phone" />
                    </td>
                    <td>
                        <form:errors size="35" path="phone" />
                    </td>
                </tr>
                <tr>
                    <td>
                    	<b>Web Site:</b>
                    </td>
                    <td>
                        <form:input size="35" path="webURL" />
                    </td>
                    <td>
                        <form:errors size="35" path="webURL" />
                    </td>
                    <br>
                </tr>
                <tr>
                    <td>
                    	<b>Latitude:</b>
                    </td>
                    <td>
                        <form:input size="35" path="latitude" />
                    </td>
                    <td>
                        <form:errors size="35" path="latitude" />
                    </td>
                </tr>
                <tr>
                    <td>
                    	<b>Longitude:</b>
                    </td>
                    <td>
                        <form:input size="35" path="longitude" />
                    </td>
                    <td>
                        <form:errors size="35" path="longitude" />
                    </td>
                </tr>
            </table>
            <table id="dealers">
                <br>
                <tr>
                    <th colspan="1">${dealer.name}</th>
                    <th colspan="1">${dealer.phone}</th>
                    <th colspan="6"><a class="link" href="http://www.${dealer.webURL}" target="_blank">${dealer.webURL}</a></th>
                </tr>
                <tr>
                    <td colspan="1">${dealer.address}
                        <br>${dealer.city}, ${dealer.state} ${dealer.zip}
                    </td>
                    <td colspan="1">
                        <iframe src="https://www.google.com/maps/embed/v1/place?q=${dealer.latitude},${dealer.longitude}
     &zoom=15
     &key=AIzaSyDNvUM1WrERX0if8WeUuJW22mSgfA0oR8M">
                        </iframe>
                    </td>
                    <td colspan="1">
                        <p><a class="btn-sm" href="${dealer.locationURL}" target="_blank">Directions</a></p>
                    </td>
                </tr>
            </table>
        </form:form>
        <div class="report">
            <form:form action="GetDealerList.do" method="GET" modelAttribute="dealer">
                <br>
                <strong><h3 class="heading-title">Store Inventory</h3></strong>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="thead-inverse">
                            <tr>
                                <th>Tire Category</th>
                                <th>Brand</th>
                                <th>Size</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="tire" items="${tires}">
                                <tr>
                                    <th scope="row">${tire.categoryValue}</th>
                                    <td>${tire.brandValue}</td>
                                    <td>${tire.sizeValue}</td>
                                    <td>${tire.quantity}</td>
                                    <td>${tire.priceValue}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </form:form>
        </div>
    </div>
</body>

</html>