<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Paste - Pastes</title>
<style type="text/css">
#pastes {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
}

#pastes td, #pastes th {
    border: 1px solid #ddd;
    padding: 8px;
}

#pastes tr:nth-child(even){background-color: #f2f2f2;}

#pastes tr:hover {background-color: #ddd;}

#pastes th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #ccffff;
    color: black;
}
</style>
</head>
<body>
	<h3>Spring Pastes - All Pastes page</h3>
	<hr>
	<a href="${pageContext.request.contextPath}/userDetails">Create New User</a>
	<hr>
	<table id="pastes">
		<tr>
			<th>Username</th>
			<th>Role</th>
			<th>Operation</th>
		</tr>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.username}</td>
				<td>${user.authority.authority}</td>
				<td>Operations later</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	
	<a href="${pageContext.request.contextPath}/pastes">Go Back</a>
</body>
</html>