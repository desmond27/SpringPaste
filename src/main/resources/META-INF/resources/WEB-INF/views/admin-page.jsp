<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Paste - Admin Page</title>
<style type="text/css">
ul > li {
	display: inline-block;
	margin: 5px;
}
</style>
</head>
<body>
	<h3>Spring Paste - Admin Page</h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/newPaste">Create New Paste</a></li>
		<li><a href="${pageContext.request.contextPath}/pastes">View Your Pastes</a></li>
		<li><a href="${pageContext.request.contextPath}/getAllPastes">View all pastes</a></li>
		<li><a href="${pageContext.request.contextPath}/manageUsers">Manage Users</a></li>
	</ul>
	
	<hr>
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>