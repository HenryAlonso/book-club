<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Info</title>
<link rel="stylesheet" type ="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar bg-body-tertiary">
		<div class="container-fluid">
			<div class="h-100 p-5">
				<h2><c:out value="${book.title}"></c:out></h2>
			</div>
			<div class="inline">
				<a href="/books">Back to the shelves</a>
			</div>
		</div>
	</nav>
	<div class="text content">
		<p><span style="color:red;">
		<c:choose>
			<c:when test="${book.user.id == user.id }">
				You
			</c:when>
			<c:otherwise>
			<c:out value="${book.user.userName}"></c:out>
			</c:otherwise>
		</c:choose>
		</span> read
		<span style="color:purple;">
		<c:out value="${book.title}"></c:out></span> by 
		<span style="color:green;">
		<c:out value="${book.author}"></c:out></span></p>
		<p>
		<c:choose>
			<c:when test="${book.user.id == user.id}">
				Here are your thoughts:
			</c:when>
			<c:otherwise>
				Here are <c:out value="${book.user.userName}'s"></c:out> thoughts:
			</c:otherwise>
		</c:choose>
		</p>
		
		<hr class="thick-hr">
		<p><c:out value="${book.thoughts}"></c:out></p>
		<hr class="thick-hr">
		
	</div>
</body>
</html>