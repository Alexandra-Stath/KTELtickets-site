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

	String price = (String) session.getAttribute("price");

    String payMethod = request.getParameter("paymentMethod");
    
	// Set the payment method in session
    if (payMethod != null) {
        session.setAttribute("payMethod", payMethod);
    } else {
        payMethod = (String) session.getAttribute("payMethod");
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

	<title>KTELtickets - Payment Page</title>

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
			
			<h1>Πληρωμή κράτησης εισητηρίου με: <%= "paypal".equals(payMethod) ? "PayPal" : "Πιστωτική Κάρτα" %></h1>
		</div>
	</div>
	<!-- /container -->

	<form class="form-horizontal" name="paymentForm" method="POST" action="order_complete.jsp">

<% 		if (payMethod.equals("creditCard")) { %>
			<div id="creditCardFields">
				<div class="form-group">
					<label for="cardNumber" class="col-sm-4 control-label">Αριθμός Κάρτας:</label>
					<div class="col-sm-8">
						<input type="tel" inputmode="numeric" class="form-control" name="cnumber" id="cardNumber" pattern="(\d{4}\s){3}\d{4}" placeholder="XXXX XXXX XXXX XXXX" required>
					</div>
				</div>

				<div class="form-group">
					<label for="expiryDate" class="col-sm-4 control-label">Ημερομηνία Λήξης:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="expdate" id="expiryDate" placeholder="MM/YY" pattern="^(0[1-9]|1[0-2])(\/|-)([0-9]{2})$" required>
					</div>
				</div>

				<div class="form-group">
					<label for="cvv" class="col-sm-4 control-label">CVV:</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="cvv" id="cvv" placeholder="***" pattern="[0-9\s]{3,3}" required>
					</div>
				</div>

				<div class="form-group">
					<label for="cardHolder" class="col-sm-4 control-label">Όνομα Κατόχου:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="cholder" id="cardHolder" placeholder="Name Surname" pattern="([a-zA-Z]{3,}\s)+[a-zA-Z]{3,}" required>
					</div>
				</div>

				<div class="form-group">
					<label for="price" class="col-sm-4 control-label">Ποσό:</label>
					<div class="col-sm-8">
						<p id="price" class="form-control-static"><%= price %> €</p>
					</div>
				</div>
			</div>

<% 		} else { %>

			<div id="creditCardFields">
				<div class="form-group">
					<label for="fName" class="col-sm-4 control-label">Όνομα Κατόχου:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="fname" id="fName" pattern="[a-zA-Z]{3,}" placeholder="Name" required>
					</div>
				</div>

				<div class="form-group">
					<label for="uEmail" class="col-sm-4 control-label">Email:</label>
					<div class="col-sm-8">
						<input type="email" class="form-control" name="email" id="uEmail" placeholder="Someone@mail.com" pattern="9.-]+\.[a-zA-Z]{2,}$" required>
					</div>
				</div>

				<div class="form-group">
					<label for="uPhone" class="col-sm-4 control-label">Αριθμός Κινητού:</label>
					<div class="col-sm-8">
						<input type="tel" class="form-control" name="phone" id="uPhone" placeholder="69XXXXXXXX" pattern="^69\d{8}$" required>
					</div>
				</div>

				<div class="form-group">
					<label for="price" class="col-sm-4 control-label">Ποσό:</label>
					<div class="col-sm-8">
						<p id="price" class="form-control-static"><%= price %> €</p>
					</div>
				</div>

<% 		} %>
		<div class="buttons">
			<button class="buttons" type="submit">Ολοκλήρωση πληρωμής</button>
		</div>

	</form>

	<%@ include file="footer.jsp" %>
</body>

</html>