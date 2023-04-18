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
<title>Book Club</title>
<link rel="stylesheet" type ="text/css" href="/css/style.css">
 <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
 <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="content">
		<div>
			<h1>Welcome to the Book Club!</h1>
			<p>A place for friends to share thoughts on books.</p>
		</div>
		<div class="register bg">
			<h2 class="form-header">Register</h2>
			<form:form action="/register" method="post" modelAttribute="newUser">
			<div class="mb-3 inline">
			    <div class="one">
				    <form:label for="exampleInputEmail1" class="form-label" path="userName">Name: </form:label>
				    <form:errors class="errors" path="userName"/>
			    </div>
				<div class="two">
			    	<form:input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" path="userName"/>		
				</div>							
			</div>
		    <div class="mb-3 inline">
		    	<div class="one">
			    	<form:label for="exampleInputEmail1" class="form-label" path="email">Email: </form:label>
			    	<form:errors class="errors" path="email"/>
			    </div>
			    <div class="two">
		    		<form:input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" path="email"/>
		  		</div>
		  	</div>
			 <div class="mb-3 inline">
			 	<div class="one">
				    <form:label for="exampleInputPassword1" class="form-label" path="password">Password: </form:label>
				    <form:errors class="errors" path="password"/>
			 	</div>
			 	<div class="two">
				    <form:input type="password" class="form-control" id="exampleInputPassword1" path="password"/>
			 	</div>
			 </div>
			 <div class="mb-3 inline">
			 	<div class="one">
				    <form:label for="exampleInputPassword1" class="form-label" path="confirm">Confirm Password: </form:label>
				    <form:errors class="errors" path="confirm"/>
			 	</div>
			 	<div class="two">
				    <form:input type="password" class="form-control" id="exampleInputPassword1" path="confirm"/>
			 	</div>
			 </div>
			 <div>
			  <button type="submit" class="btn btn-secondary bg submit">Create Account</button>
			 </div>
			</form:form>
		</div>
			  
		<div class="login bg top">
		<h2 class="form-header">Login</h2>
			<form:form action="/login" method="post" modelAttribute="newLogin">
			<div class="mb-3 inline">
				<div class="one">
			    	<form:label for="exampleInputEmail1" class="form-label" path="email">Email: </form:label>
			    	<form:errors class="errors" path="email"/>
				</div>
				<div class="two">
			    	<form:input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" path="email"/>
				</div>
		  	</div>
			 <div class="mb-3 inline">
			 	<div class="one">
				    <form:label for="exampleInputPassword1" class="form-label" path="password">Password: </form:label>
				    <form:errors class="errors" path="password"/>
			 	</div>
			 	<div class="two">
				    <form:input type="password" class="form-control" id="exampleInputPassword1" path="password"/>
			 	</div>
			 </div>
			 <button type="submit" class="btn btn-secondary bg submit">Login</button>
			 </form:form>
		</div>
	</div>
</body>
</html>