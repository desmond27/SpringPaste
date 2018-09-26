<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<title>Spring Paste - Pastes</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/pastes">SpringPaste</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pastes">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/newPaste">New Paste</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/manageUsers">Manage Users <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			</ul>
			<form:form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/logout" method="POST">
				<!-- <input class="form-control mr-sm-2" placeholder="Search" type="text"> -->
				<a class="nav-link" style="color: white;">${principal.name}</a>
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
			</form:form>
		</div>
	</nav>
	<%-- <a href="${pageContext.request.contextPath}/userDetails">Create New User</a> --%>
	<div style="margin-right: 33%; margin-left: 33%; align-self: center;">
	<table id="pastes" class="table table-hover">
		<thead>
		<tr>
			<th>Username</th>
			<th>Role</th>
			<th>Operation</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.username}</td>
				<td>${user.authority.authority}</td>
				<td>
					<a href="${pageContext.request.contextPath}/editUser?username=${user.username}">Edit </a>|
					<a href="${pageContext.request.contextPath}/deleteUser?username=${user.username}">Delete </a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<button class="btn btn-primary" onclick="window.location='${pageContext.request.contextPath}/createUser'">Create New User</button>
	</div>
</body>
</html>