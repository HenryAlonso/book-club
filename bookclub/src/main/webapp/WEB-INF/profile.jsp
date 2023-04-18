<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard</title>
<link rel="stylesheet" type ="text/css" href="/css/style.css">
 <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
 <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar bg-body-tertiary">
		<div class="container-fluid">
			<div class="h-100 p-5">
				<h2>Welcome <c:out value="${user.userName}"></c:out>!</h2>
				<p>Books from everyone's shelves: </p>
			</div>
			<div class="inline">
				<a class="logout" href="/logout"><button>Logout</button></a>
				<a href="/book/new"><button>+ Add a book to your profile</button></a>				
			</div>
		</div>
	</nav>
	<div>
		<table class="table table-primary table-striped border_line">
	  		<thead class="border_line">
		    	<tr class="table table-primary">
			      	<th scope="col">ID</th>
			      	<th scope="col">Title</th>
			      	<th scope="col">Author Name</th>
			      	<th scope="col">Posted By</th>
		    	</tr>
		  	</thead>
		  	<tbody class="border_line">
		  		<c:forEach var="oneBook" items="${books}">
		  			<tr>
		  				<td>
		  					<c:out value="${oneBook.id}"></c:out>
		  				</td>		  				
		  				<td>
		  					<a href="/books/${oneBook.id}">
								<c:out value="${oneBook.title}"></c:out>		  				
		  					</a>
		  				</td>		  				
		  				<td>
		  					<c:out value="${oneBook.author}"></c:out>
		  				</td>		  				
		  				<td>
		  					<c:out value="${oneBook.user.userName}"></c:out>
		  				</td>		  				
		  			</tr>
		  		</c:forEach>
			</tbody>
		</table>
	</div>

	
</body>
</html>