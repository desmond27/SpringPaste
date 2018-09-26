<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<title>Spring Paste - New Paste</title>
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
				<security:authorize access="hasRole('ADMIN')">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/manageUsers">Manage Users</span></a></li>
				</security:authorize>
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
		<c:when test="${paste.id == 0}">
			<h3>New Paste - ${principal.name}</h3>
		</c:when>
		<c:otherwise>
			<h3>Edit Paste - ${principal.name}</h3>
		</c:otherwise>
	</c:choose>
	<form:form action="${pageContext.request.contextPath}/savePaste" modelAttribute="paste" method="POST">
		<p>Title: <input type="text" name="title" value="${paste.title}"></p>
		<p>Public?:
			<c:choose>
			<c:when test="${paste.publicPaste == true }"> 
				<input type="checkbox" name="publicPaste" checked="checked">
			</c:when>
			<c:otherwise>
				<input type="checkbox" name="publicPaste">
			</c:otherwise>
			</c:choose>
		</p>
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