<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Spring Paste</title>
	<style type="text/css">
		.error {
			color: red;
		}
		.success {
			color: green;
		}
	</style>
</head>
<body>
	<h3>Spring Paste - Login</h3>
	<form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST">
		<c:if test="${param.error != null }">
			<p class="error">Invalid username/password</p>
		</c:if>
		<c:if test="${param.logout != null }">
			<p class="success">Successfully logged out!</p>
		</c:if>
		<p>Username:<input type="text" name="username" /></p>
		<p>Password:<input type="password" name="password" /></p>
		<input type="submit" value="Login"/>
	</form:form>
</body>
</html>