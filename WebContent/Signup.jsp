<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
<body>
	<h2> Sign Up</h2>
	<form action="Signup" method="post">
		<div>
			<!-- <label>Enter First Name:</label> -->
			<input type="text" name="first_name" placeholder="First Name">
		</div>
		<div>
			<!-- <label>Enter Last Name:</label -->
			<input type="text" name="last_name" placeholder="Last Name">
		</div>
		<div>
			<!-- <label>Enter Username:</label> -->
			<input type="text" name="username" placeholder="Username">
		</div>
		<div>
			<!-- <label>Enter Password:</label> -->
			<input type="password" name="passwd" placeholder="Password">
		</div>
		<div>
			<!-- <label>Enter Email:</label> -->
			<input type="email" name="email" placeholder="youremail@mail.com">
		</div>
		<div>
			<label>Are you a..</label>
			<select name="accessType">
				<option value="Patron">Patron</option>
				<option value="Staff">Staff</option>
			</select>
		</div>
		<input type="submit" value="Submit">
	</form>
</body>
</html>