<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddAnnouncement</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
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
<br>
<div class="container"> 
	<div class="row">	
		<div class="col-md-4 shadow p-3 mb-5 bg-white rounded">
	<h2>Add Announcement</h2>
	<form action="announce" method="post">
		<div>
			<input type="text" name="title" placeholder="Title of Announcement">
		</div>
		<div>
			<textarea name="message" placeholder="Announcement Text"></textarea>
		</div>
		<input type="submit" value="Submit">
		
	</form>
	</div>
	</div>
</div>
</body>
</html>