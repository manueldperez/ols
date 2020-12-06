<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patron Dashboard</title>
</head>
<body bgcolor="magenta">
	
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	
	WELCOME TO THE ONLINE LIBRARY SYSTEM!
	
	<a href="bookshelf.jsp">View Bookshelf</a>
	<a href="holds.jsp">View Holds</a>
	<a href="fines.jsp">View Fines</a>
	<a href="history.jsp">View History</a>
	<a href="bookshelf.jsp">View Bookshelf</a>
	
	<form action="simpleSearch" method="post">
		<input type="search" name="simpleSearch">
	<button>Search</button>
	</form>
	
	<form action="Logout">
		<input type="submit" value="Logout">
	</form>
	
</body>
</html>