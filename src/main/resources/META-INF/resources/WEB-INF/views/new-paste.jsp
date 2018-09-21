<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Paste - New Paste</title>
</head>
<body>
	<c:choose>
		<c:when test="${paste.id == 0}">
			<h3>New Paste - ${principal.name}</h3>
		</c:when>
		<c:otherwise>
			<h3>Edit Paste - ${principal.name}</h3>
		</c:otherwise>
	</c:choose>
	<form:form action="${pageContext.request.contextPath}/savePaste" modelAttribute="paste" method="POST">
		<p>Title: <input type="text" name="title" value="${paste.title}"></p>
		<p>Public?: <input type="checkbox" name="publicPaste" checked="${paste.publicPaste == true ? checked : }"></p><!-- TODO: Debug this later -->
		<p>Content:<br />
		<form:textarea path="content" rows="30" cols="150" /></p>
		<input type="hidden" name="username" value="${principal.name}"/>
		<input type="hidden" name="id" value="${paste.id}" />
		<input type="submit" value="Save" />
	</form:form>
	<hr>
	<a href="${pageContext.request.contextPath}/">Go back</a>
</body>
</html>