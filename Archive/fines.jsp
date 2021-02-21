<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="edu.sdsu.mdperez.dao.DBConnection"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Fines</title>
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
        <a class="nav-link active" href="fines.jsp">View Fines</a>
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
	<div class="container shadow p-3 mb-5 bg-white rounded">
	<h1>Fines</h1>
	
	<table class="table table-striped">
	<thead>
		<tr>
			<th>Overdue Materials</th>
		</tr>
	</thead>
		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection conn = DBConnection.getConnection();

		int user_id = (int) session.getAttribute("user_id");

		String query = "SELECT return_date FROM inventory WHERE checked_out_by=" + user_id;

		PreparedStatement ps = conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		int i = 0;

		rs.next();
			LocalDate return_date = LocalDate.parse(rs.getString(1));
			System.out.println(return_date);
			
			String query2 = "SELECT title FROM inventory WHERE checked_out_by="+user_id+" AND \"2021-03-23\" > \"" + return_date + "\"";

			PreparedStatement ps2 = conn.prepareStatement(query2);
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next()) {
				%>
				<tr>
					<td><%=rs2.getNString("title")%></td>
				</tr>
				<%
				i++;
			}
		%>
	</table>
	</div>
	<div class="container shadow p-3 mb-5 bg-white rounded">
		
			
			<table class="table table-striped">
			<thead>
			<tr>
				<th>Total Amount Due</th>
			<tr>
			</thead>
			<tr>
				<td>$<%= i * 2 %></td>
			<tr>
			</table>
			
		
	</div>

</body>
</html>