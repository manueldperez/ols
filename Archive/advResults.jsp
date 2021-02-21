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
<title>Advanced Results</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%String accessType = (String) session.getAttribute("user_access"); %>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">OLS</a>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
      	<%if (accessType.equals("Patron"))%><a class="nav-link" href="patronDashboard.jsp">Dashboard</a>
      	<%if (accessType.equals("Staff")) %> <a class="nav-link" href="staffDashboard.jsp">Return To Dashboard</a>
        <a class="nav-link" href="advSearch.jsp">Advanced Search</a>
        <a class="nav-link" href="bookshelf.jsp">Bookshelf</a>
        <a class="nav-link" href="fines.jsp">View Fines</a>
        <a class="nav-link" href="history.jsp">View History</a>

        <form action="results.jsp" method="post">
		<input type="search" name="simpleSearch">
			<button class="btn">Search</button>
		</form>
		<form action="Logout">
		<input type="submit" value="Logout">
		</form>
      </div>
    </div>
  </div>
</nav>
	<h2>Advanced Search Results:</h2>
	<table class="table table-striped">
	<thead>
	<tr>
		<th>Title</th>
		<th>Author</th>
		<th>Book Description</th>
		<th>Publisher</th>
		<th>Material Type</th>
		<th>Release Date</th>
		<th>Genre</th>
		<th>Additional Genre</th>
		<th>Additional Genre</th>
		<th>Category</th>
		<th>Check Out</th>
		
	</tr>
	</thead>
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
				<button class="btn btn-success" type="submit" name="product_id" value="<%=productId[i]%>">Check Out!</button>
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