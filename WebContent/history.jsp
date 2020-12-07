<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="edu.sdsu.mdperez.dao.DBConnection" %>
<%
String id = request.getParameter("userid");

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
<title>History</title>
</head>
<body>
	<h1>History:</h1>
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
		<th>Title</th>
		
	</tr>
	<%
	try {
		connection = DBConnection.getConnection();
		statement = connection.createStatement();
		int currUser = (int) session.getAttribute("user_id");
		
		String query = "SELECT * FROM checkoutLog WHERE user_id =" + currUser;
				
		resultSet = statement.executeQuery(query);
		while(resultSet.next()){
	%>
	<tr>
		<td><%=resultSet.getString("title") %></td>
		
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