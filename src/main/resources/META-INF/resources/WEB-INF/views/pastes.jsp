<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Paste - Pastes</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">SpringPaste</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/pastes">Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/newPaste">New Paste</a></li>
				<security:authorize access="hasRole('ADMIN')">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/manageUsers">Manage Users</a></li>
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
	<table id="pastes" class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Creator</th>
				<th>Timestamp</th>
				<th>Public?</th>
				<th>Operations</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="paste" items="${pastes}">
				<c:choose>
					<c:when test="${paste.publicPaste == false}">
						<tr class="table-secondary">
							<td>${paste.id}</td>
							<td><a href="${pageContext.request.contextPath}/paste?id=${paste.id}">${paste.title}</a></td>
							<td>${paste.username}</td>
							<td><fmt:formatDate value="${paste.timestamp}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${paste.publicPaste}</td>
							<td>
								<a href="${pageContext.request.contextPath}/editPaste?id=${paste.id}">Edit </a>|
								<a href="${pageContext.request.contextPath}/deletePaste?id=${paste.id}">Delete </a>|
								<a href="${pageContext.request.contextPath}/togglePaste?id=${paste.id}">Toggle Public </a>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${paste.id}</td>
							<td><a href="${pageContext.request.contextPath}/paste?id=${paste.id}">${paste.title}</a></td>
							<td>${paste.username}</td>
							<td><fmt:formatDate value="${paste.timestamp}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${paste.publicPaste}</td>
							<td>
								<a href="${pageContext.request.contextPath}/editPaste?id=${paste.id}">Edit </a>|
								<a href="${pageContext.request.contextPath}/deletePaste?id=${paste.id}">Delete </a>|
								<a href="${pageContext.request.contextPath}/togglePaste?id=${paste.id}">Toggle Public </a>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>