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
<title>CirculationReport</title>
</head>
<body>
	<h1>Circulation Report</h1>
	<table border="1">
	<tr>
		<td>Title</td>
		<td>Due Date</td>
		<td>Overdue By(days)</td>
		<td>Overdue Fine($)</td>
		<td>Patron Number</td>
		
	</tr>
	<%
	try {
		connection = DBConnection.getConnection();
		statement = connection.createStatement();
		
		
		String query = "SELECT * FROM inventory WHERE checked_out_by IS NOT NULL";
				
		resultSet = statement.executeQuery(query);
		while(resultSet.next()){
	%>
	<tr>
		<td><%=resultSet.getString("title") %></td>
		<td><%=resultSet.getString("return_date") %></td>
		<td><%=resultSet.getString("overdue_by") %></td>
		<td><%=resultSet.getString("amt_overdue") %></td>
		<td><%=resultSet.getString("checked_out_by") %></td>
		
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