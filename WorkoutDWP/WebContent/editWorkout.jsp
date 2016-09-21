<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Workout</title>
</head>
<body>
	<c:set var="counter" value="${0}" scope="page" />
	<form:form modelAttribute="catVars" method="post"
		action="EditWorkout.do">
		<c:forEach var="w" items="${workout}">
			<p>
				${w.exercise.exerciseName }
				<c:if test="${w.exercise.category.weight}">
					<form:input path="workoutList[${counter}]" placeholder="weight"
						size="10" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</c:if>
				<c:if test="${w.exercise.category.reps}">
					<form:input path="workoutList[${counter}]" placeholder="reps"
						size="10" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</c:if>
				<c:if test="${w.exercise.category.time}">
					<form:input path="workoutList[${counter}]" placeholder="time"
						size="10" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</c:if>
				<c:if test="${w.exercise.category.pace}">
					<form:input path="workoutList[${counter}]" placeholder="pace"
						size="10" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</c:if>
				<c:if test="${w.exercise.category.distance}">
					<form:input path="workoutList[${counter}]" placeholder="distance"
						size="10" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</c:if>
				<c:if test="${w.exercise.category.incline}">
					<form:input path="workoutList[${counter}]" placeholder="incline"
						size="10" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</c:if>
				<c:if test="${w.exercise.category.level}">
					<form:input path="workoutList[${counter}]" placeholder="level"
						size="10" />
					<c:set var="counter" value="${counter + 1}" scope="page" />
				</c:if>
			</p>
			<c:set var="workoutId" value="${w.workout.id}" scope="page" />
		</c:forEach>
		<input type="hidden" name="year" value="${date.year}" />
		<input type="hidden" name="month" value="${date.monthInt}" />
		<input type="hidden" name="day" value="${date.dayInt}" />
		<input type="hidden" name="accountId" value="${account.id}" />
		<input type="hidden" name="workoutId" value="${workoutId}" />
		<button type="submit">Submit</button>
	</form:form>
</body>
</html>