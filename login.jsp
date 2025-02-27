<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Login page">
	<meta name="author" content="Alexandra Stathopoulou">

	<title>KTELtickets - Login Page</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Optional theme -->
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<!-- Custom styles for this template -->
	<link href="css/theme_ismgroup29_login.css" rel="stylesheet">
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

	<form class="form-horizontal" id="loginForm" method="POST" action="loginController.jsp">
		<h3>Συμπληρώστε τα στοιχεία σύνδεσης:</h3>
		<div id="loginCredentials">
			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">Όνομα Χρήστη:</label>
				<div class="col-sm-8">
					<input type="text" name="username" class="form-control" id="username" placeholder="Εισάγετε το όνομα χρήστη" required>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">Κωδικός Πρόσβασης:</label>
				<div class="col-sm-8">
					<input type="password" name="password" class= "form-control" id="password" placeholder="Εισάγετε τον κωδικό πρόσβασης" required>
				</div>
			</div>
		</div>

		<div class="buttons">
			<button class="buttons" type="submit">Σύνδεση</button>
		</div>

		<div class="btn-2">
			<!-- Register button in bottom-left corner -->
			<a href="register.jsp" class="btn-2">Εγγραφή</a>
		</div>

		
	</form>

	<%@ include file="footer.jsp" %>
</body>

</html>
