<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Spring Paste</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="#">SpringPaste</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarColor01">
	    <ul class="navbar-nav mr-auto">
<!-- 	      <li class="nav-item active">
	        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Features</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Pricing</a>
	      </li> -->
	      <li class="nav-item">
	        <a class="nav-link" href="#">About</a>
	      </li>
	    </ul>
<%-- 	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" placeholder="Search" type="text">
	      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
	    </form> --%>
	  </div>
	</nav>
	<div class="login-page">
	  	<div class="form">
	  		<h3>Login</h3>
			<f:form action="${pageContext.request.contextPath}/authenticateUser" method="POST" class="login-form" id="main-login-form">
				<input type="text" name="username" placeholder="Username"/>
				<input type="password" name="password" placeholder="Password"/>
				<!-- <input type="submit" value="Login"/> -->
				<button type="submit" class="btn btn-primary">Login</button>
				<c:if test="${param.error != null }">
					<p class="error">Invalid username/password</p>
				</c:if>
				<c:if test="${param.logout != null }">
					<p class="success">Successfully logged out!</p>
				</c:if>
			</f:form>
		</div>
	</div>
</body>
</html>