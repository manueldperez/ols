<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Advanced Search</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
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
        <a class="nav-link active" href="advSearch.jsp">Advanced Search</a>
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
			<h2>Advanced Search</h2>
			<form action="advResults.jsp" method="post">
				<div>
					<input type="text" name="author" placeholder="Author">
				</div>
				<div>
					<input type="text" name="title" placeholder="Title">
				</div>
				<div>
					<input type="text" name="keyword" placeholder="Keyword">
				</div>
				<div>
					<label>Genre</label>
					<select name="genre">
						<option value="empty"></option>
						<option value="Fiction">Fiction</option>
						<option value="Non_Fiction">Non-fiction</option>
						<option value="Romance">Romance</option>
						<option value="Horror">Horror</option>
						<option value="Biography">Biography</option>
						<option value="Fantasy">Fantasy</option>
						<option value="Young_Adult">Young Adult</option>
					</select>
				</div>
				<div>
					<label>Extra Genre (Optional)</label>
					<select name="extra_genre">
						<option value="empty"></option>
						<option value="Fiction">Fiction</option>
						<option value="Non_Fiction">Non-fiction</option>
						<option value="Romance">Romance</option>
						<option value="Horror">Horror</option>
						<option value="Biography">Biography</option>
						<option value="Fantasy">Fantasy</option>
						<option value="Young_Adult">Young Adult</option>
					</select>
				</div>
				<div>
					<label>Extra Genre (Optional)</label>
					<select name="extra_genre2">
						<option value="empty"></option>
						<option value="Fiction">Fiction</option>
						<option value="Non_Fiction">Non-fiction</option>
						<option value="Romance">Romance</option>
						<option value="Horror">Horror</option>
						<option value="Biography">Biography</option>
						<option value="Fantasy">Fantasy</option>
						<option value="Young_Adult">Young Adult</option>
					</select>
				</div>
				<div>
					<label>Type of Material</label>
					<select name="material_type">
						<option value="Kindle Book">Kindle Book</option>
						<option value="OverDrive_Read">OverDrive Read</option>
						<option value="EPUB">EPUB Book</option>
						<option value="PDF_eBook">PDF eBook</option>
					</select>
				</div>
				<input type="submit" value="Submit">
				
			</form>
	</div>
	</div>
</div>
</body>
</html>