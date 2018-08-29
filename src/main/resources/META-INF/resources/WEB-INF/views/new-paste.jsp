<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Paste - New Paste</title>
</head>
<body>
	<h3>New Paste - ${principal.name}</h3>
	<form:form action="${pageContext.request.contextPath}/savePaste" modelAttribute="paste" method="POST">
		<p>Title: <input type="text" name="title"></p>
		<p>Public?: <input type="checkbox" name="publicPaste"></p>
		<p>Content:<br />
		<form:textarea path="content" rows="30" cols="150" /></p>
		<input type="hidden" name="username" value="${principal.name}"/>
		<input type="submit" value="Save" />
	</form:form>
	<hr>
	<a href="${pageContext.request.contextPath}/">Go back</a>
</body>
</html>