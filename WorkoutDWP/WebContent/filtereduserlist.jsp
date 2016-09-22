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
<div class="navbar-header">
    <a class="navbar-toggle">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </a>
    <h1><a class="navbar-brand" href="index.html">TireDEX</a></h1>
</div>

<body>
    <div class="getfiltereddealer">
        <form action="GetFilteredDealerList.do" method="GET" modelAttribute="dealer">
            <strong><h3 class="heading-title">Local Tire Dealers and Installation Service Centers</h3></strong>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="thead-inverse">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Zip</th>
                            <th>Phone</th>
                            <th>Location</th>
                            <th></th>
                            <th>Update</th>
                            <th></th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dealer" items="${dealers}">
                            <tr>
                                <th scope="row">${dealer.index}</th>
                                <td>${dealer.name}</td>
                                <td>${dealer.address}</td>
                                <td>${dealer.city}</td>
                                <td>${dealer.state}</td>
                                <td>${dealer.zip}</td>
                                <td>${dealer.phone}</td>
                                <td><a style="text-align: center;" class="btn-sm" href="${dealer.locationURL}" target="_blank">Map</a>
                                </td>
                                <form action="GetDealerEdit.do" method="GET">
                                    <td>
                                        <input type="hidden" value="Edit">
                                    </td>
                                    <td>
                                        <input type="hidden" value="${dealer.index}" name="update">
                                        <button type="submit" class="btn-sm">Edit</button>
                                    </td>
                                </form>
                                <form action="GetDealerRemove.do" method="GET">
                                    <td>
                                        <input type="hidden" value="Remove">
                                    </td>
                                    <td>
                                        <input type="hidden" value="${dealer.index}" name="update">
                                        <button style="color: red" type="submit" class="btn-sm">Remove</button>
                                    </td>
                                </form>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</body>

</html>