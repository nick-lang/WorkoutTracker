<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
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
<LINK href="editWorkout.css" rel="stylesheet" type="text/css">
<title>Edit Workout</title>
</head>
<body class="bg">
	<c:set var="counter" value="${counter = 0}" scope="page" />

	<form:form modelAttribute="catVars" method="post"
		action="EditWorkout.do">

		<c:forEach var="w" items="${workout}">

			<h4 style="text-transform: capitalize">${w.exercise.exerciseName }</h4>
			<div class="row">

					<c:if test="${w.exercise.category.weight}">
				<div class="col-md-1 text-center">
						<h5 style="text-transform: capitalize">weight</h5>
						<form:input class="input" path="workoutList[${counter}]"
							value="${w.weight }" size="10" required="required" />
						<c:set var="counter" value="${counter + 1}" scope="page" />
				</div>
					</c:if>
					<c:if test="${w.exercise.category.reps}">
				<div class="col-md-1 text-center">
						<h5 style="text-transform: capitalize">reps</h5>
						<form:input class="input" path="workoutList[${counter}]"
							value="${w.reps }" size="10" required="required" />
						<c:set var="counter" value="${counter + 1}" scope="page" />
				</div>
					</c:if>
				<c:if test="${w.exercise.category.time}">
				<div class="col-md-1 text-center">
					<h5 style="text-transform: capitalize">time</h5>
					<form:input class="input" path="workoutList[${counter}]" value="${w.time }"
						size="10" required="required" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</div>
				</c:if>
				<c:if test="${w.exercise.category.pace}">
				<div class="col-md-1 text-center">
					<h5 style="text-transform: capitalize">pace</h5>
					<form:input class="input" path="workoutList[${counter}]" value="${w.pace }"
						size="10" required="required" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</div>
				</c:if>
				<c:if test="${w.exercise.category.distance}">
				<div class="col-md-1 text-center">
					<h5 style="text-transform: capitalize">distance</h5>
					<form:input class="input" path="workoutList[${counter}]"
						value="${w.distance }" size="10" required="required" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</div>
				</c:if>
				<c:if test="${w.exercise.category.incline}">
				<div class="col-md-1 text-center">
					<h6 style="text-transform: capitalize">incline</h6>
					<form:input class="input" path="workoutList[${counter}]"
						value="${w.incline }" size="10" required="required" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</div>
				</c:if>
				<c:if test="${w.exercise.category.level}">
				<div class="col-md-1 text-center">
					<h5 style="text-transform: capitalize">level</h5>
					<form:input class="input" path="workoutList[${counter}]"
						value="${w.level }" size="10" required="required" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</div>
				</c:if>
				

			</div>

			<br />
			<br />
			<c:set var="workoutId" value="${w.workout.id}" scope="page" />
		</c:forEach>
		<input type="hidden" name="year" value="${date.year}" />
		<input type="hidden" name="month" value="${date.monthInt}" />
		<input type="hidden" name="day" value="${date.dayInt}" />
		<input type="hidden" name="accountId" value="${account.id}" />
		<input type="hidden" name="workoutId" value="${workoutId}" />

		<button class="btn btn-lg btn-primary " type="submit">Submit</button>

	</form:form>
	<br />
	<form:form method="post" action="RemoveWorkout.do">
		<input type="hidden" name="year" value="${date.year}" />
		<input type="hidden" name="month" value="${date.monthInt}" />
		<input type="hidden" name="day" value="${date.dayInt}" />
		<input type="hidden" name="accountId" value="${account.id}" />

		<button class="btn btn-lg btn-primary " type="submit">Delete
			Workout</button>

	</form:form>

</body>
</html>