<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="gray">
	
	<%
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
	%>

	WELCOME TO THE ONLINE LIBRARY SYSTEM!
	
	<a href="tobe.jsp">something</a>
	
	<form action="Logout">
		<input type="submit" value="Logout">
	</form>
	
</body>
</html>