<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#e6eff5">
	<div class="container">
		<div class="row">
		
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
				
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					
						<div class="container shadow p-3 mb-5 bg-white rounded">
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
				<option value="empty"></option>
				<option value="Patron">Patron</option>
				<option value="Staff">Staff</option>
			</select>
		</div>
		<input type="submit" value="Submit">
	</form>
	</div>
	</div>
	</div>
	</div>
</body>
</html>