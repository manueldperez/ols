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
<title>Staff Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body bgcolor=#f6f5ff>
	
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
	
<nav class="navbar navbar-expand-sm navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Welcome to your OLS Dashboard</a>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
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
<br>
<div class="container container-fluid shadow p-3 mb-5 bg-white rounded">
	<div class="row">
		<div class="col-md-4 mb-3">
			<form action="addInventory.jsp" method="post">
				<button type="submit" class="btn btn-outline-success">Add Inventory</button>
			</form>
		</div>
		
			<form action="circulationReport.jsp" method="post">
				<button type="submit" class="btn btn-outline-success">View Circulation Report</button>
			</form>
		
	</div>
</div>
<div class="container shadow p-3 mb-5 bg-white rounded">
	<h3>Announcements</h3>
<% while(resultSet.next()){ 
			String title = resultSet.getString("title");
			String announce = resultSet.getString("announcement_text");%>
			<div class="alert alert-primary" role="alert">
				<h5 class="alert-heading"><%=title%></h5>
				<p><%=announce%></p>
			</div>
			
<%}%>
	<form action="announcement.jsp" method="post">
		<button type="submit" class="btn btn-outline-success">Make Announcement</button>
	</form>
</div>


</body>
</html>