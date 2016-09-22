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
        <h3 style="color: green"><b>Edit Dealer Info</b></h3>
        <form:form action="GetDealerEdit.do" modelAttribute="dealer">
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
                    <td><b>Business Name:</b>
                    </td>
                    <td>
                        <form:input size="35" path="name" />
                    </td>
                    <td>
                        <form:errors size="35" path="name" />
                    </td>
                </tr>
                <tr>
                    <td><b>Address:</b>
                    </td>
                    <td>
                        <form:input size="35" path="address" />
                    </td>
                    <td>
                        <form:errors size="35" path="address" />
                    </td>
                </tr>
                <tr>
                    <td><b>City:</b>
                    </td>
                    <td>
                        <form:input size="35" path="city" />
                    </td>
                    <td>
                        <form:errors size="35" path="city" />
                    </td>
                </tr>
                <tr>
                    <td><b>State:</b>
                    </td>
                    <td>
                        <form:input size="35" path="state" />
                    </td>
                    <td>
                        <form:errors size="35" path="state" />
                    </td>
                </tr>
                <tr>
                    <td><b>Zip Code:</b>
                    </td>
                    <td>
                        <form:input size="35" path="zip" />
                    </td>
                    <td>
                        <form:errors path="zip" />
                    </td>
                </tr>
                <tr>
                    <td><b>Web Site:</b>
                    </td>
                    <td>
                        <form:input size="35" path="webURL" />
                    </td>
                    <td>
                        <form:errors size="35" path="webURL" />
                    </td>
                </tr>
                <tr>
                    <td><b>Phone:</b>
                    </td>
                    <td>
                        <form:input size="35" path="phone" />
                    </td>
                    <td>
                        <form:errors size="35" path="phone" />
                    </td>
                </tr>
                <tr>
                    <td><b>Latitude:</b>
                    </td>
                    <td>
                        <form:input size="35" path="latitude" />
                    </td>
                    <td>
                        <form:errors size="35" path="latitude" />
                    </td>
                </tr>
                <tr>
                    <td><b>Longitude:</b>
                    </td>
                    <td>
                        <form:input size="35" path="longitude" />
                    </td>
                    <td>
                        <form:errors size="35" path="longitude" />
                    </td>
                </tr>
                <tr>
                    <td><b>Location URL:</b>
                    </td>
                    <td>
                        <form:input size="180" path="locationURL" />
                    </td>
                    <td>
                        <form:errors size="180" path="locationURL" />
                    </td>
                </tr>
            </table>
            <input class="btn-sm" style="color: green" type="submit" value="Submit" />
        </form:form>
    </div>
</body>

</html>