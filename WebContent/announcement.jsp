<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	
	<%
		String accessType = (String) session.getAttribute("user_access");
	%>
	
	<h2>Add Inventory</h2>
	
	<div>
		<% if (accessType.equals("Patron")) { %> <a href="patronDashboard.jsp">Dashboard</a> <% } %>
		<% if (accessType.equals("Staff")) { %> <a href="staffDashboard.jsp">Dashboard</a> <% } %>
	</div>
	<br>
	
	<form action="announce" method="post">
		<div>
			<input type="text" name="title" placeholder="Title of Announcement">
		</div>
		<div>
			<textarea name="message" placeholder="Announcement Text"></textarea>
		</div>
		<input type="submit" value="Submit">
		
	</form>

</body>
</html>