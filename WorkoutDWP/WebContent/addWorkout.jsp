<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Add a Workout</title>
</head>
<body>
	<c:forEach var="w" items="${workouts}">
		<form id="form" action="AddWorkout.do" method="POST">
			<input type="hidden" name="year" value="${date.year}" /> <input
				type="hidden" name="month" value="${date.monthInt}" /> <input
				type="hidden" name="day" value="${date.dayInt}" /> <input
				type="hidden" name="accountId" value="${account.id}" /><input
				type="hidden" name="workoutId" value="${w.id}" /> <input
				type="submit" name="add" value="${w.name}" />
		</form>
	</c:forEach>
</body>
</html>