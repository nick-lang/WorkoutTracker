<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>Calendar</title>
</head>
<body>

	<form id="form" action="GetCalendarData.do" method="GET">
		<input class="button" type="submit" name="back" value="Back" /> 
		<input class="button" type="submit" name="next" value="Next" />
	</form>
	
	<table border="1" cellspacing="0" cellpadding="4">
		<tr>
			<td width="100%" colspan="7">Jan 2016</td>
		</tr>
		<tr>
			<th width="15%">Sun</th>
			<th width="14%">Mon</th>
			<th width="14%">Tue</th>
			<th width="14%">Wed</th>
			<th width="14%">Thu</th>
			<th width="14%">Fri</th>
			<th width="15%">Sat</th>
		</tr>
		<tr>
			<td>day</td>
			<td>day</td>
			<td>day</td>
			<td>day</td>
			<td>day</td>
			<td>day</td>
			<td>day</td>
		</tr>
	</table>
</body>
</html>