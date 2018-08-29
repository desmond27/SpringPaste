<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Paste - Admin - Add User</title>
</head>
<body>
<h3>Add New User</h3>
<hr>
<form:form action="/saveUser" method="POST">
	<p>Username: <input type="text" name="username" /></p><br>
	<p>Password: <input type="password" name="password" /></p><br>
	<p>Role:</p><br>
	<p><input type="radio" name="role" value="ROLE_ADMIN">Admin</p><br>
	<p><input type="radio" name="role" id="ROLE_USER"></p>User<br>
	<input type="submit" value="Save">
</form:form>
<hr>
</body>
</html>