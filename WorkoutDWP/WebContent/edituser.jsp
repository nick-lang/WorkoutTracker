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
        <h1><a class="navbar-brand" href="index.html">Workout Tracker</a></h1>
        <h3 style="color: green"><b>Edit User Info</b></h3>
        <form:form action="GetUserEdit.do" modelAttribute="user">
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
                    <td><b>First Name:</b>
                    </td>
                    <td>
                        <form:input size="35" path="firstName" />
                    </td>
                    <td>
                        <form:errors size="35" path="firstName" />
                    </td>
                </tr>
                <tr>
                    <td><b>Last Name:</b>
                    </td>
                    <td>
                        <form:input size="35" path="lastName" />
                    </td>
                    <td>
                        <form:errors size="35" path="lastName" />
                    </td>
                </tr>
                <tr>
                    <td><b>Address:</b>
                    </td>
                    <td>
                        <form:input size="35" path="address.address" />
                    </td>
                    <td>
                        <form:errors size="35" path="address.address" />
                    </td>
                </tr>
                <tr>
                    <td><b>City:</b>
                    </td>
                    <td>
                        <form:input size="35" path="address.city" />
                    </td>
                    <td>
                        <form:errors size="35" path="address.city" />
                    </td>
                </tr>
                <tr>
                    <td><b>State:</b>
                    </td>
                    <td>
                        <form:input size="35" path="address.state" />
                    </td>
                    <td>
                        <form:errors size="35" path="address.state" />
                    </td>
                </tr>
                <tr>
                    <td><b>Zip Code:</b>
                    </td>
                    <td>
                        <form:input size="35" path="address.zip" />
                    </td>
                    <td>
                        <form:errors path="address.zip" />
                    </td>
                </tr>
                <tr>
                    <td><b>Email:</b>
                    </td>
                    <td>
                        <form:input size="35" path="email" />
                    </td>
                    <td>
                        <form:errors size="35" path="email" />
                    </td>
                </tr>
                <tr>
                    <td><b>Phone:</b>
                    </td>
                    <td>
                        <form:input size="35" path="address.phone" />
                    </td>
                    <td>
                        <form:errors size="35" path="address.phone" />
                    </td>
                </tr>
                <tr>
                    <td><b>Age:</b>
                    </td>
                    <td>
                        <form:input size="35" path="age" />
                    </td>
                    <td>
                        <form:errors size="35" path="age" />
                    </td>
                </tr>
                <tr>
                    <td><b>Height:</b>
                    </td>
                    <td>
                        <form:input size="35" path="height" />
                    </td>
                    <td>
                        <form:errors size="35" path="height" />
                    </td>
                </tr>
                <tr>
                    <td><b>Weight:</b>
                    </td>
                    <td>
                        <form:input size="180" path="weight" />
                    </td>
                    <td>
                        <form:errors size="180" path="weight" />
                    </td>
                </tr>
            </table>
            <input class="btn-sm" style="color: green" type="submit" value="Submit" />
        </form:form>
    </div>
</body>

</html>