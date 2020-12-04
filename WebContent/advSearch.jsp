<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Advanced Search</title>
</head>
<body>

	<%
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
	%>

	<h2> Sign Up</h2>
	<form action="AdvSearch" method="post">
		<div>
			<!-- <label>Enter First Name:</label> -->
			<input type="text" name="author" placeholder="Author">
		</div>
		<div>
			<!-- <label>Enter Last Name:</label -->
			<input type="text" name="title" placeholder="Title">
		</div>
		<div>
			<!-- <label>Enter Username:</label> -->
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

</body>
</html>