<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.regex.*" %>
<%@ page import="KTEL.*" %>

<%

String payMethod = (String) session.getAttribute("payMethod");

// If page is accessed directly, redirect to payment.jsp
if (payMethod == null) {
    throw new Exception("You have not selected a payment method, please visit <a href='payment_method.jsp'>payment page</a>.");
}

int countErrors = 0;

if ("creditCard".equals(payMethod)) {
    String cnumber = request.getParameter("cnumber");
    String expdate = request.getParameter("expdate");
    String cvv = request.getParameter("cvv");
    String cholder = request.getParameter("cholder");

    // Validating credit card number
    if (cnumber == null || cnumber.trim().isEmpty() || cnumber.length() != 16 || !cnumber.matches("\\d{16}")) {
        countErrors++;
    }

    // Validating CVV
    if (cvv == null || cvv.trim().isEmpty() || cvv.length() != 3 || !cvv.matches("\\d{3}")) {
        countErrors++;
    }

    // Validating cardholder name
    String namePattern = "([a-zA-Z]{3,}\\s)+[a-zA-Z]{3,}";
    Pattern p = Pattern.compile(namePattern);
    Matcher m = p.matcher(cholder);
    if (cholder == null || !m.matches()) {
        countErrors++;
    }

    // Validating expiry date
    String datePattern = "^(0[1-9]|1[0-2])([/|-])([0-9]{2})$";
    Pattern p2 = Pattern.compile(datePattern);
    Matcher m2 = p2.matcher(expdate);
    if (expdate == null || !m2.matches()) {
        countErrors++;
    }

    // If there are errors, redirect back to payment.jsp
    if (countErrors > 0) {
        request.setAttribute("errorMessage", "Form has " + (countErrors == 1 ? "1 error!" : countErrors + " errors!"));
%>
        <jsp:forward page="payment.jsp"/>
<%
        return;
    }

} else if ("paypal".equals(payMethod)) {
    String email = request.getParameter("email");
    
    // Validating PayPal email
    if (email == null || email.trim().isEmpty() || !email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
        countErrors++;
    }

    // If there are errors, redirect back to payment.jsp
    if (countErrors > 0) {
        request.setAttribute("errorMessage", "Form has " + (countErrors == 1 ? "1 error!" : countErrors + " errors!"));
%>
        <jsp:forward page="payment.jsp"/>
<%
        return;
    }

} else {
    throw new Exception("Invalid payment method selected.");
}

// Redirect to order completion page
request.setAttribute("successMessage", "Payment processed successfully!");
%>
<jsp:forward page="order_complete.jsp"/>
