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
        <a class="nav-link active" href="bookshelf.jsp">Bookshelf</a> 
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
	<div class="container shadow p-3 mb-5 bg-white rounded">
	<h2>Welcome to your Bookshelf</h2>
	<table class="table table-striped">
	<thead>
		<tr>
			<th>Title</th>
			<th>Author</th>
			<th>Due Date</th>
		</tr>
	</thead>
	
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
		<td><%=resultSet.getString("return_date") %></td>
		
	</tr>
	<%
	}
	connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	</table>
	</div>
	
	
</body>
</html>