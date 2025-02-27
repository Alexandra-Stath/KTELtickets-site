<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Register page">
	<meta name="author" content="Alexandra Stathopoulou">

	<title>KTELtickets - Register Page</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Optional theme -->
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<!-- Custom styles for this template -->
	<link href="css/theme_ismgroup29_login.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<!-- Font Awesome v6.0.0-beta3 CDN link for scalable vector icons (e.g., check, cross) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container" role="main">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
					aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">KTELtickets</a>
			</div>
		</div>
	</nav>

<%
	if (request.getAttribute("errorMessage") != null) {	
%>		
	<div class="container">		
		<div class="row">
			<div class="col-xs-12">

				<div class="alert alert-danger">
					<%=(String)request.getAttribute("errorMessage") %>
				</div>

			</div>
		</div>
	</div>
<%
	}			
%>

	<form class="form-horizontal" id="loginForm" method="POST" action="registerController.jsp">

		<h3>Συμπληρώστε τα στοιχεία εγγραφής:</h3>

		<div id="loginCredentials">
			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">Όνομα Χρήστη:</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="username" id="username" placeholder="Επιλέξτε όνομα χρήστη" required>
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="col-sm-4 control-label">Email:</label>
				<div class="col-sm-8">
					<input type="email" class="form-control" name="email" id="email" placeholder="Εισάγετε το email σας" required>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">Κωδικός Πρόσβασης:</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="password" id="password" placeholder="Επιλέξτε κωδικό πρόσβασης"
						required>
				</div>
			</div>

			<div class="form-group">
				<label for="check_password" class="col-sm-4 control-label">Επιβεβαίωση κωδικού:</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="confpassword" id="check_password"
						placeholder="Επαναλάβετε τον κωδικό πρόσβασης" required>
				</div>
			</div>
		</div>

		<div class="buttons">
			<button class="buttons" type="submit">Εγγραφή</button>
		</div>

		<div class="btn-2">
			<!-- Register button in bottom-left corner -->
			<a href="login.jsp" class="btn-2">Σύνδεση</a>
		</div>
	</form>

	<div class="container">		
		<div class="row">
			<div class="col-xs-12">
				<div class="alert alert-info"><strong>Help: </strong>
					<ul>
						<li><strong>Username:</strong> must be at least 6 characters long.</li>
						<li><strong>Email:</strong> enter a valid email address.</li>
						<li><strong>Password:</strong> must be at least 7 characters long.</li>
						<li><strong>Confirmation:</strong> passwords must match.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp" %>
</body>

</html>