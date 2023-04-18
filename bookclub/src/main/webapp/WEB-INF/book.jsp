<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<link rel="stylesheet" type ="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar bg-body-tertiary">
		<div class="container-fluid">
			<div class="h-100 p-5">
				<h2>Add a Book to Your Shelf!</h2>
			</div>
			<div class="inline">
				<a href="/books">Back to the shelves</a>
			</div>
		</div>
	</nav>
	<div class="edit">
		<form:form action="/books/new/process" method="post" modelAttribute="book">
			<form:errors path="user" class="errors"/>
			<form:input type="hidden" path="user" value="${user.id}"/>
		
		<div class="mb-3 inline">
			<form:label path="title">Title: </form:label>
			<form:errors path="title" class="errors"/>
			<form:input type="text" path="title"></form:input>
		</div>
		<div class="mb-3 inline">
			<form:label path="author">Author: </form:label>
			<form:errors path="author" class="errors"/>
			<form:input type="text" path="author"></form:input>
		</div>
		<div class="mb-3 inline">
			<form:label path="thoughts">My Thoughts: </form:label>
			<form:errors path="thoughts" class="errors"/>
			<form:textarea path="thoughts"/>
		</div>			
			
			<button type="submit" class="btn btn-secondary">Add Book</button>
		</form:form>
	</div>
</body>
</html>