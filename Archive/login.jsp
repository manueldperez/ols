<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#EFFEFF">
	
	<div class="container">
		<div class="row">
		
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
				
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					
						<div class="container shadow p-3 mb-5 bg-white rounded">
							<h1 class="text-center">Welcome to the OLS!</h1>
							<br>
							<form action="Login" method="post">
							<div class="form-group">
							<label class="control-label" for="username">Username</label>
							<input type="text" name=username class="form-control" placeholder="Username">
							</div>
							
							<div class="form-group">
							<label class="control-label" for="passwd">Password</label>
							<input type="password" name=passwd class="form-control" placeholder="Password">
							</div>
							<br>
							
							
								<button type="submit" class="btn btn-outline-success" value="Login">Sign in</button>
							</form>
							
							<div class="col">
							<form action="Signup.jsp" method="post">
								<button type="submit" class="btn btn-outline-primary" value="Signup">Sign Up</button>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
						
</body>
</html>