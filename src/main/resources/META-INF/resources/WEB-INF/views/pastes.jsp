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
	<ul>
		<li><a href="${pageContext.request.contextPath}/newPaste">Create New Paste</a></li>
		<security:authorize access="hasRole('ADMIN')">
			<li><a href="${pageContext.request.contextPath}/pastes">View Your Pastes</a></li>
			<li><a href="${pageContext.request.contextPath}/getAllPastes">View all pastes</a></li>
			<li><a href="${pageContext.request.contextPath}/manageUsers">Manage Users</a></li>
		</security:authorize>
	</ul>
	<hr>
	<table id="pastes">
		<tr>
			<th>Id</th>
			<th>Title</th>
			<th>Username</th>
			<th>Timestamp</th>
			<th>Public?</th>
		</tr>
		<c:forEach var="paste" items="${pastes}">
			<tr>
				<td>${paste.id}</td>
				<td><a href="${pageContext.request.contextPath}/paste?id=${paste.id}">${paste.title}</a></td>
				<td>${paste.username}</td>
				<td><fmt:formatDate value="${paste.timestamp}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${paste.publicPaste}</td>
			</tr>
		</c:forEach>
	</table>
	<hr>

	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>