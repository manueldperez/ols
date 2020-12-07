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

int[] productId = new int[10];
int i = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookshelf</title>
</head>
<body>
	<h1>Advanced Search Results:</h1>
	
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
		<td>Book Description</td>
		<td>Publisher</td>
		<td>Material Type</td>
		<td>Release Date</td>
		<td>Genre</td>
		<td>Additional Genre</td>
		<td>Additional Genre</td>
		<td>Category</td>
		<td>Check Out</td>
		
	</tr>
	<%
	
	try {
		connection = DBConnection.getConnection();
		statement = connection.createStatement();
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String keyword = request.getParameter("keyword");
		String genre = request.getParameter("genre");
		String material_type = request.getParameter("material_type");
		
		String query = "SELECT * "
				+ "FROM inventory "
				+ "WHERE MATCH(author, title, publisher, genre, extra_genre, extra_genre2, material_type) "
				+ "AGAINST(\""+author+" "+title+" "+keyword+" "+genre+" "+material_type+"\" IN BOOLEAN MODE)";
		resultSet = statement.executeQuery(query);
		while(resultSet.next()){
			productId[i] = Integer.parseInt(resultSet.getString("product_id"));
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
		<td>
			<form action="Checkout" method="post">
				<button type="submit" name="product_id" value="<%=productId[i]%>">Check Out!</button>
			</form>
		</td>
	</tr>
	<%
		i++;
		}
		connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	</table>
</body>
</html>