<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body bgcolor="pink">
	<form action="Login" method="post">
	<div>
		<label>Enter Username:</label>
		<input type="text" name="username">
	</div>
	<div>
		<label>Enter Password:</label>
		<input type="password" name="passwd">
	</div>
	<input type="submit" value="Login">  <br>
	</form>
	
	<form action="signup.jsp" method="post">
		<input type="submit" value="Signup">
	</form>
	
</body>
</html>