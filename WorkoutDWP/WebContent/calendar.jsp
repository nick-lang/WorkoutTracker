<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<LINK href="calendar.css" rel="stylesheet" type="text/css">
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
<title>Calendar</title>
</head>
<body class="bg">
	<h1 class="form-signin-heading" style="color: white">${date.monthName}</h1>
	<form id="form" action="GetCalendarData.do" method="GET">
		<input type="hidden" name="year" value="${date.year}" /> <input
			type="hidden" name="month" value="${date.monthInt}" /> <input
			type="hidden" name="day" value="${date.dayInt}" /> <input
			type="hidden" name="accountId" value="${account.id}" /> <input
			class="btn btn-lg btn-primary" type="submit" name="back" value="Back" />
		<input class="btn btn-lg btn-primary" type="submit" name="next"
			value="Next" />
	</form>

	<div class="month">
		<c:set var="preDays" value="${preDays = (date.firstDayOfMonth - 1) }" />
		<c:if test="${preDays ne 0}">
			<div class="week">
		</c:if>
		<c:forEach var="i" begin="1" end="${preDays}">
			<div class="day"></div>

		</c:forEach>

		<c:forEach var="i" begin="1" end="${date.days}">
			<c:if test="${((preDays + i) mod 7) == 1}">
				<div class="week">
			</c:if>
			<div class="day">
				<c:out value="${i}" />
				<div class="info">

					<c:set var="hasEdit" value="false" />
					<c:forEach var="w" items="${workouts}">
						<fmt:formatDate pattern="dd" value="${w.date}" var="fDate" />

						<c:if test="${i == fDate}">
							<div class="text-uppercase">${w.workout.name}</div>
							<form id="form" action="GetEditWorkout.do" method="GET">
								<input type="hidden" name="year" value="${date.year}" /> <input
									type="hidden" name="month" value="${date.monthInt}" /> <input
									type="hidden" name="day" value="${i}" /> <input type="hidden"
									name="accountId" value="${account.id}" /> <input type="hidden"
									name="workoutId" value="${w.id}" /> <input
									class="btn btn-default" type="submit" name="edit"
									value="View/Edit" />
							</form>
							<c:set var="hasEdit" value="true" />
						</c:if>
					</c:forEach>
					<c:if test="${hasEdit eq 'false'}">
						<form id="form" action="GetAddWorkout.do" method="GET">
							<input type="hidden" name="year" value="${date.year}" /> <input
								type="hidden" name="month" value="${date.monthInt}" /> <input
								type="hidden" name="day" value="${i}" /> <input type="hidden"
								name="accountId" value="${account.id}" /> <input
								class="btn btn-default" type="submit" name="add"
								value="Add Workout" />
						</form>
					</c:if>
				</div>
			</div>



			<c:if test="${i == date.days and ((preDays + i) mod 7) ne 0}">
				<c:set var="postDays" value="${7 - ((preDays + i) mod 7)}" />
				<c:forEach var="i" begin="1" end="${postDays}">
					<div class="day"></div>
				</c:forEach>
			</c:if>
			<c:if test="${((preDays + i) mod 7) == 0}">
	</div class="week">
	</c:if>
	</c:forEach>
	</div class="month">
	</div>
	<form:form method="GET" action="index.html">
		<button class="btn btn-lg btn-primary " type="submit">Logout</button>
	</form:form>
</body>
</html>