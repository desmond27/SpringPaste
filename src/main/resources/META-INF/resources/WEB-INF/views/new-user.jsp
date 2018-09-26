<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<title>Spring Paste - Admin - Add/Edit User</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">SpringPaste</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pastes">Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/newPaste">New Paste</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/manageUsers">Manage Users</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			</ul>
			<form:form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/logout" method="POST">
				<!-- <input class="form-control mr-sm-2" placeholder="Search" type="text"> -->
				<a class="nav-link" style="color: white;">${principal.name}</a>
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
			</form:form>
		</div>
	</nav>
	<c:choose>
		<c:when test="${user.username == null}">
			<h3>Add New User</h3>
		</c:when>
		<c:otherwise>
			<h3>Edit User</h3>
		</c:otherwise>
	</c:choose>
	
	<hr>
	<form:form action="${pageContext.request.contextPath}/saveUser" method="POST" modelAttribute="user">
		<fieldset>
			<legend>Login Info</legend>
			<div class="form-group">
				<label for="usernameInput">Username:</label>
				<input id="usernameInput" class="form-control" type="text" name="username" value="${user.username}"/>
			</div>
			<div class="form-group">
				<label for="passwordInput">Password:</label> 
				<input id="passwordInput" class="form-control" type="password" name="password" value="${user.password}"/>
			</div>
			<fieldset class="form-group">
				<legend>Role</legend>
				<div class="form-check">
					<label class="form-check-label"> <input class="form-check-input" name="authority.authority" id="optionsRadios1" value="ROLE_USER" checked="" type="radio">
						User
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input class="form-check-input" name="authority.authority" id="optionsRadios2" value="ROLE_ADMIN" type="radio"> 
						Admin
					</label>
				</div>
			</fieldset>
<!-- 			<p>Role:</p>
			<br>
			<p>
				<input type="radio" name="role" value="ROLE_ADMIN">Admin
			</p>
			<br>
			<p>
				<input type="radio" name="role" id="ROLE_USER">User
			</p>
			<br> -->
			<input type="hidden" name="enabled" value="true" />
			<button class="btn btn-primary" type="submit">Save</button>
		</fieldset>
	</form:form>
	<hr>
</body>
</html>