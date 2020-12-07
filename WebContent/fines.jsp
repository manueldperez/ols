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
</head>
<body>
	<h1>Fines</h1>
	
	<table border="1">
		<tr>
			<td>Overdue Materials</td>
		</tr>

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
	
	<table border="1">
		<tr>
			<td>Total Amount Due</td>
		<tr>
		<tr>
			<td><%= i * 2 %></td>
		<tr>
		
	</table>

</body>
</html>