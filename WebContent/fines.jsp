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
<title>Fines</title>
</head>
<body>
	<h1>Fines for Overdue Materials</h1>
	
	<table border="1">
	<thead>
		<tr>
			<th>Title</th>
			<th>Fine Amount</th>
		</tr>
	</thead>
	
	<tbody>
		<%
		int currUser = (int) session.getAttribute("user_id");
		try {
			
			connection = DBConnection.getConnection();
			statement = connection.createStatement();
			String sql = "SELECT * FROM inventory WHERE overdue_by="+ currUser;
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
		%>
		<tr>
			<td><%=resultSet.getString("title") %></td>
			<td><%=resultSet.getString("amt_overdue") %></td> 
		</tr>
		<%
		}
		connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</tbody>
	
	<tfoot>
			<%
			try {
				connection = DBConnection.getConnection();
				statement = connection.createStatement();
				String sql = "SELECT * FROM users WHERE user_id="+ currUser;
				resultSet = statement.executeQuery(sql);
				resultSet.next(); 
			%>
			<tr>
				<th>TOTAL:</th>
				<td><%=resultSet.getString("overdue_fines") %></td> 
			</tr>
			<%
			connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
	</tfoot> 
	</table> 
	
</body>
</html>