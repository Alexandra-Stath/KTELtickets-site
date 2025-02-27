<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "KTEL.*"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.Arrays" %>

<% 
    if (session.getAttribute("userObj2024")==null) {
        request.setAttribute("errorMessage","You are not authorized to access this resource. Please login.");
%>
        <jsp:forward page="login.jsp"/>
<%
    }

    // Retrieve session attributes
    String[] seats = (String[]) session.getAttribute("seats");
    Accounts accounts = (Accounts) session.getAttribute("userObj2024"); 
    String emailID = accounts.getEmail();
    String routeID = (String) session.getAttribute("route");
    String priceID = (String) session.getAttribute("price");

    // Create TicketsDAO instance and add ticket, capture ticketID
    TicketsDAO tDAO = new TicketsDAO();
    int ticketID = tDAO.addTicket(seats, routeID, emailID, priceID);  // Add ticket and get the ticket ID

    // Update the seats to reserved
    tDAO.updateSeats(seats);  // Call the updateSeats method to mark the seats as reserved
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>KTELtickets - Payment Progress Page</title>
    <link href="css/theme_ismgroup29_payment.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Optional theme -->
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
</head>
<body>

    <!-- Fixed navbar -->
	<%
	String currentPage = "Happy travels!";
	%>
    <%@ include file="navbar.jsp" %>

    <div class="container theme-showcase" role="main">
        <div class="jumbotron" style="background-color: white; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <% if (ticketID > 0) { %>
                <h1>Η κράτηση ολοκληρώθηκε επιτυχώς!</h1>
                <p>Σας ευχαριστούμε θερμά για την προτίμησή σας!</p>
                <p>Το ηλεκτρονικό εισιτήριο σας έχει σταλεί στο καταχωρημένο email.</p>
            <% } else { %>
                <h1>Η κράτηση απέτυχε</h1>
                <p>Λυπούμαστε, αλλά υπήρξε πρόβλημα με την κράτησή σας.</p>
                <p>Παρακαλώ δοκιμάστε ξανά.</p>
            <% } %>
        </div>

        <div class="order-details">
            <h2>Στοιχεία Κράτησης</h2>
            <ul>
                <li><strong>Αριθμός Κράτησης:</strong> <%= ticketID %></li> <!-- Display the ticket ID -->
                <li><strong>Email:</strong> <%= emailID %></li>
                <li><strong>Τρόπος Πληρωμής:</strong> 
                    <%= "creditCard".equals(session.getAttribute("payMethod")) ? "Πιστωτική Κάρτα" : "PayPal" %>
                </li>
                <li><strong>Ποσό Πληρωμής:</strong> <%= priceID %> €</li>
                <li><strong>Αναχώρηση:</strong> <%= session.getAttribute("date") %></li>
                <li><strong>Διαδρομή:</strong> <%= routeID %></li>
                <li><strong>Θέσεις:</strong> 
                    <%
                        // Sort the seats array in ascending order
                        Arrays.sort(seats);

                        // Loop over the sorted seats and display them
                        for (int i = 0; i < seats.length; i++) {
                            out.print(seats[i]);
                            if (i < seats.length - 1) {
                                out.print(", "); // Add a comma between seat numbers, except after the last one
                            }
                        }
                    %>

                </li>
            </ul>
        </div>
    </div>

    <!-- Include footer -->
    <%@ include file="footer.jsp" %>

</body>
</html>
