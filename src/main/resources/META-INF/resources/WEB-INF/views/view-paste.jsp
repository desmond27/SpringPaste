<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="js/highlight/styles/default.css" type="text/css" />
<script src="js/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<title>Spring Paste - ${paste.title}</title>
</head>
<body>
<h3>${paste.title}</h3>
<security:authorize access="hasRole('ADMIN')">
	<li><a href="${pageContext.request.contextPath}/">Go Back</a></li>
	<li><a href="${pageContext.request.contextPath}/editPaste?id=${paste.id}">Edit</a></li>
	<li><a href="${pageContext.request.contextPath}/deletePaste?id=${paste.id}">Delete</a></li>
</security:authorize>
<hr>
<pre><code class="cpp">${paste.content}</code></pre><!-- TODO: class must be autodetect or perhaps later we can store highlighting data to database and populate this as such. -->
<hr>
</body>
</html>