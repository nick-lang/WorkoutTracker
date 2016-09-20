<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>Calendar</title>
</head>
<body>
	<h1>${date.monthName}</h1>
	<form id="form" action="GetCalendarData.do" method="GET">
		<input type="hidden" name="year" value="${date.year}" /> <input
			type="hidden" name="month" value="${date.monthInt}" /> <input
			type="hidden" name="day" value="${date.dayInt}" /> <input
			type="hidden" name="accountId" value="${account.id}" /> <input
			type="submit" name="back" value="Back" /> <input type="submit"
			name="next" value="Next" />
	</form>

	<c:forEach var="i" begin="1" end="${date.days}">
   Day: <c:out value="${i}" />
		<p>
			<c:set var="hasEdit" value="false" />
			<c:forEach var="w" items="${workouts}">
				<fmt:formatDate pattern="dd" value="${w.date}" var="fDate" />

				<c:if test="${i == fDate}">
					${w.workout.name}
					<form id="form" action="EditWorkout.do" method="GET">
						<input type="hidden" name="year" value="${date.year}" /> <input
							type="hidden" name="month" value="${date.monthInt}" /> <input
							type="hidden" name="day" value="${i}" /> <input type="hidden"
							name="accountId" value="${account.id}" /> <input type="submit"
							name="edit" value="View/Edit" />
					</form>
					<c:set var="hasEdit" value="true" />
				</c:if>
			</c:forEach>
			<c:if test="${hasEdit eq 'false'}">
				<form id="form" action="AddWorkout.do" method="GET">
					<input type="hidden" name="year" value="${date.year}" /> <input
						type="hidden" name="month" value="${date.monthInt}" /> <input
						type="hidden" name="day" value="${i}" /> <input type="hidden"
						name="accountId" value="${account.id}" /> <input type="submit"
						name="add" value="Add Workout" />
				</form>
			</c:if>
		<p>
	</c:forEach>
</body>
</html>