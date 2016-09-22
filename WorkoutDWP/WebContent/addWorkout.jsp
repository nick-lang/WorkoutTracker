<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="addWorkout.css">
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
<title>Add a Workout</title>
</head>
<body class="bg">
	<div>
		<c:forEach var="w" items="${workouts}">
			<form id="form" action="AddWorkout.do" method="POST">
				<input type="hidden" name="year" value="${date.year}" /> <input
					type="hidden" name="month" value="${date.monthInt}" /> <input
					type="hidden" name="day" value="${date.dayInt}" /> <input
					type="hidden" name="accountId" value="${account.id}" /><input
					type="hidden" name="workoutId" value="${w.id}" /> <input
					type="submit" name="add" value="${w.name}"
					class="btn btn-lg btn-primary btn-block" />
			</form>
			<br/>
		</c:forEach>
	<form:form method="GET" action="GetLogin.do">
		<input type="hidden" name="workouts" value="${account.id}" />
		<button class="btn btn-lg btn-primary " type="submit">Cancel</button>
	</form:form>
	</div>
</body>
</html>