<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>Calendar</title>
</head>
<body>
<h1>${date.monthName}</h1>
	<form id="form" action="GetCalendarData.do" method="GET">
		<input type="hidden" name="year" value="${date.year}" />
		<input type="hidden" name="month" value="${date.monthInt}" />
		<input type="hidden" name="day" value="${date.dayInt}"/>
		<input type="hidden" name="accountId" value="${account.id}" />
		<input type="submit" name="back" value="Back" />
		<input type="submit" name="next" value="Next" />
	</form>
	
<c:forEach var="i" begin="1" end="${date.days}">
   Day: <c:out value="${i}"/><p>
</c:forEach>
</body>
</html>