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
<title>Bookshelf</title>
</head>
<body>
	<h1>Search Results:</h1>
	<table border="1">
	<tr>
		<td>Title</td>
		<td>Author</td>
		<td>Book Description</td>
		<td>Publisher</td>
		<td>Material Type</td>
		<td>Release Date</td>
		<td>Genre</td>
		<td>Additional Genre</td>
		<td>Additional Genre</td>
		<td>Category</td>
		
	</tr>
	<%
	
	try {
		connection = DBConnection.getConnection();
		statement = connection.createStatement();
		String keyword = request.getParameter("simpleSearch");
		
		String query = "SELECT * "
				+ "FROM inventory WHERE MATCH(author, title, genre, extra_genre, extra_genre2) "
				+ "AGAINST('+"+keyword+"')";
		resultSet = statement.executeQuery(query);
		while(resultSet.next()){
	%>
	<tr>
		<td><%=resultSet.getString("title") %></td>
		<td><%=resultSet.getString("author") %></td>
		<td><%=resultSet.getString("book_desc") %></td>
		<td><%=resultSet.getString("publisher") %></td>
		<td><%=resultSet.getString("material_type") %></td>
		<td><%=resultSet.getString("release_date") %></td>
		<td><%=resultSet.getString("genre") %></td>
		<td><%=resultSet.getString("extra_genre") %></td>
		<td><%=resultSet.getString("extra_genre2") %></td>
		<td><%=resultSet.getString("category") %></td>
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