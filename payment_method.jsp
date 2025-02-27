<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "KTEL.*"%>
<%@ page errorPage="error.jsp"%>

<% 
	if (session.getAttribute("userObj2024")==null) {
		request.setAttribute("errorMessage","You are not authorized to access this resource. Please login.");
%>
		<jsp:forward page="login.jsp"/>
<%
	}
    String price = request.getParameter("price");

	// Set the price method in session
    if (price != null) {
        session.setAttribute("price", price);
    } else {
        price = (String) session.getAttribute("price");
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Payment method page">
	<meta name="author" content="Alexandra Stathopoulou">

	<title>KTELtickets - Payment Method Page</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Optional theme -->
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<!-- Custom styles for this template -->
	<link href="css/theme_ismgroup29_payment.css" rel="stylesheet">
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
	<%
	String currentPage = "payment";
	%>
	<%@ include file="navbar.jsp" %>

	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Επιλέξτε Τρόπο Πληρωμής εισητηρίου</h1>
		</div>
	</div>
	<!-- /container -->

	<form class="form-horizontal" name="paymentForm" method="POST" action="payment.jsp">
		<div class="form-group">
			<label for="paymentMethod" class="col-sm-4 control-label">Επιλέξτε τρόπο πληρωμής:</label>
			<div class="col-sm-8">
				<select class="form-control" id="paymentMethod" name="paymentMethod">
					<option value="creditCard">Πιστωτική Κάρτα</option>
					<option value="paypal">PayPal</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="price" class="col-sm-4 control-label">Ποσό:</label>
			<div class="col-sm-8">
				<p id="price" class="form-control-static"><%= price %> €</p>
			</div>
		</div>

		<div class="buttons">
			<button type="submit" class="buttons">Επιβεβαίωση</button>
		</div>

	</form>

	<%@ include file="footer.jsp" %>
</body>

</html>