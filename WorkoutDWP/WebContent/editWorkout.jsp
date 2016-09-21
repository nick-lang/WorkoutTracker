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
	<c:set var="counter" value="${counter = 0}" scope="page" />
	<form:form modelAttribute="catVars" method="post"
		action="EditWorkout.do">
		<c:forEach var="w" items="${workout}">
			${w.exercise.exerciseName }
			<p />
			<c:if test="${w.exercise.category.weight}">
					weight ${w.weight }
					<form:input path="workoutList[${counter}]" placeholder="${w.weight }"
					size="10" />
				<c:set var="counter" value="${counter + 1}" scope="page" />
			</c:if>
			<c:if test="${w.exercise.category.reps}">
				reps ${w.reps }
					<form:input path="workoutList[${counter}]" placeholder="${w.reps }"
					size="10" />
				<c:set var="counter" value="${counter + 1}" scope="page" />
			</c:if>
			<c:if test="${w.exercise.category.time}">
			time ${w.time }
				<form:input path="workoutList[${counter}]" placeholder="${w.time }"
					size="10" />
				<c:set var="counter" value="${counter + 1}" scope="page" />
			</c:if>
			<c:if test="${w.exercise.category.pace}">
			pace ${w.pace }
				<form:input path="workoutList[${counter}]" placeholder="${w.pace }"
					size="10" />
				<c:set var="counter" value="${counter + 1}" scope="page" />
			</c:if>
			<c:if test="${w.exercise.category.distance}">
			distance ${w.distance }
				<form:input path="workoutList[${counter}]" placeholder="${w.distance }"
					size="10" />
				<c:set var="counter" value="${counter + 1}" scope="page" />
			</c:if>
			<c:if test="${w.exercise.category.incline}">
			incline ${w.incline }
				<form:input path="workoutList[${counter}]" placeholder="${w.incline }"
					size="10" />
				<c:set var="counter" value="${counter + 1}" scope="page" />
			</c:if>
			<c:if test="${w.exercise.category.level}">
			level ${w.level }
				<form:input path="workoutList[${counter}]" placeholder="${w.level }"
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