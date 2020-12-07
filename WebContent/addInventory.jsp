<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Inventory</title>
</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
	%>

	<h2>Add Inventory</h2>
	
	<%
		String accessType = (String) session.getAttribute("user_access");
	%>
	<div>
		<% if (accessType.equals("Patron")) { %> <a href="patronDashboard.jsp">Dashboard</a> <% } %>
		<% if (accessType.equals("Staff")) { %> <a href="staffDashboard.jsp">Dashboard</a> <% } %>
	</div>
	<br>
	
	<form action="addInventory" method="post">
		<div>
			<input type="text" name="title" placeholder="Title">
		</div>
		<div>
			<input type="text" name="author" placeholder="Author">
		</div>
		<div>
			<textarea name="message" placeholder="Book Description"></textarea>
		</div>
		<div>
			<input type="text" name="publisher" placeholder="Publisher">
		</div>
		<div>
			<label>Type of Material</label>
			<select name="material_type">
				<option value="empty"></option>
				<option value="Kindle Book">Kindle Book</option>
				<option value="OverDrive_Read">OverDrive Read</option>
				<option value="EPUB">EPUB Book</option>
				<option value="PDF_eBook">PDF eBook</option>
			</select>
		</div>
		<div>
			<label>Release Date: </label>
			<input type="date" name="release_date">
		</div>
		<div>
			<label>File Size (Optional): </label>
			<input type="number" name="fileSize" step="0.01">
		</div>
		<div>
			<label>ISBN (Optional): </label>
			<input type="text" name="ISBN">
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
			<label>Category</label>
			<select name="category">
				<option value="empty"></option>
				<option value="book">Book</option>
				<option value="movie">Movie</option>
			</select>
		</div>
		<div>
			<label for="img">Select Book Cover Image:</label>
  			<input type="file" id="img" name="img" accept="image/*">
		</div>
		<div>
			<input type="text" name="digRightsInfo" placeholder="Digital Rights Information">
		</div>
		<input type="submit" value="Submit">
		
	</form>


</body>
</html>