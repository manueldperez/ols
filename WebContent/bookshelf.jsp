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
<title>Bookshelf</title>
</head>
<body>
	<h1>Welcome to your Bookshelf!</h1>
	
	<%
		String accessType = (String) session.getAttribute("user_access");
	%>
	
	<div>
		<% if (accessType.equals("Patron")) { %> <a href="patronDashboard.jsp">Dashboard</a> <% } %>
		<% if (accessType.equals("Staff")) { %> <a href="staffDashboard.jsp">Dashboard</a> <% } %>
	</div>
	<br>
	
	<table border="1">
	<tr>
		<td>Title</td>
		<td>Author</td>
	</tr>
	<%
	int currUser = (int) session.getAttribute("user_id");

	try {
		
		connection = DBConnection.getConnection();
		statement = connection.createStatement();
		String sql = "SELECT * FROM inventory WHERE checked_out_by="+ currUser;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
	<tr>
		<td><%=resultSet.getString("title") %></td>
		<td><%=resultSet.getString("author") %></td>
		
	</tr>
	<%
	}
	connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	</table>
</body>
</html>