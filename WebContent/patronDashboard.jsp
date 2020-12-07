<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="edu.sdsu.mdperez.dao.DBConnection" %>

<%
String driver = "com.mysql.cj.jdbc.Driver";

try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patron Dashboard</title>
</head>
<body bgcolor=#f0fcfc>
	
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
		connection = DBConnection.getConnection();
		statement = connection.createStatement();
		String sql = "SELECT * FROM announcement";
		resultSet = statement.executeQuery(sql);
	%>
	
	WELCOME TO THE ONLINE LIBRARY SYSTEM!
	<br><br>
	<a href="bookshelf.jsp">View Bookshelf</a>
	<a href="fines.jsp">View Fines</a>
	<a href="history.jsp">View History</a>
	<a href="advSearch.jsp">Advanced Search</a>
	<br><br>
	<form action="results.jsp" method="post">
		<input type="search" name="simpleSearch">
	<button>Search</button>
	</form>
	<br><br>
	<div class="img-rounded" style="float: right; background-color: #fffbcf; width: 315px; height: 260px; border: 1px solid black; margin: 10px;">
		<h3 style="color: #ffffff; background-color: #002d96; text-align: center; margin: 0px; padding: 0px;">Announcements</h3>
		
		
		<div id="cc-homepage-announcements" style="height: 200px; overflow-x: hidden; overflow-y: auto; padding: 6px; text-align: left;">
		<% while(resultSet.next()){ 
			String title = resultSet.getString("title");
			String announce = resultSet.getString("announcement_text");%>
			<h4><%=title%></h4>
			<p><%=announce%></p>
		<%}%>
		</div>
		
	</div>
	
	
	<form action="Logout">
		<input type="submit" value="Logout">
	</form>
	
</body>
</html>