<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "KTEL.*"%>
<%@ page errorPage="error.jsp"%>
<%
	if (session.getAttribute("userObj2024") != null) {
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Search Page1">
	<meta name="author" content="Iraklis Kontos">
    <link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/8220065/css/bootstrap.min.css">	
		<!-- Bootstrap Optional theme -->
		
		<!-- Custom styles for this template -->
		<link href="<%=request.getContextPath() %>/8220065/css/theme_8220065.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
	<title>Search Page</title>
    </head>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin: 0;
            background-color: #efefef;
        }
    </style>
    <body>
        <%
            String currentPage = "search";
        %>
        <%@ include file="navbar.jsp" %>
        
            <h2>Λυπούμαστε, κανένα δρομολόγιο</h2>
        

        <div class="page-header">
            <h3>Δυστυχώς δεν υπαρχουν δρομολόγια που να ταιριάζουν στις απαιτήσεις σας</h3>
        </div>
        <div class="alert alert-warning" role="alert">
            Παρακαλούμε προσπαθήστε <a href="Search1.jsp" class="alert-link">ξανά </a>
        </div>
        <div class="alert alert-info" role="alert">
            Διαθέσιμα δρομολόγια για ημερομηνίες: 1-2/1/2025 
        </div>
        <div class="alert alert-success" role="alert">
            Η KTELtickets καταβάλει κάθε δυνατή προσπάθεια για την ποικιλία των δρομολογίων της
        </div>   
        <%@ include file="footer.jsp" %>
    </body>
</html>
<%
	} else {
%>
        <jsp:forward page="login.jsp" />
<%
    }
%>