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

    <!-- Custom styles for this template -->
	<link href="css/theme_ismgroup29_search.css" rel="stylesheet">

		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/8220065/css/bootstrap.min.css">	
		<!-- Bootstrap Optional theme -->
		
		<!-- Custom styles for this template -->
		<link href="<%=request.getContextPath() %>/8220065/css/theme_8220065.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
	<title>Search Page</title>
    </head>
    
    <body>
        
        <%
        String currentPage = "search";
        %>
        <%@ include file="navbar.jsp" %>

<%
        if (request.getAttribute("successMessage") != null) {	
%>				
        <div class="row">
            <div class="col-xs-12">

                <div class="alert alert-success">
                    <%=(String)request.getAttribute("successMessage") %>
                </div>

            </div>
        </div>
<%
}		
%>
            
        
        <form name="searchForm" action = "schedule_type_choice.jsp" method="post" accept-charset="UTF-8">
            <h2 class="b">Αναζήτηση εισιτηρίου</h2>
            <div class="form-group">
                <label for="from" >Από:</label>
                <select name="from" class="form-control" id="from" style="margin-left: 5px;" required>
                    <option value="" disabled selected>Επιλέξτε</option>
                    <option value="Athens">Athens</option>
                    <option value="Thessaloniki">Thessaloniki</option>
                </select>
            
                <label for="to" style="margin-left: 10px;">Προς:</label>
                <select name="to" class="form-control" id="to" style="margin-left: 5px;" required>
                    <option value="" disabled selected>Επιλέξτε</option>
                    <option value="Athens">Athens</option>
                    <option value="Thessaloniki">Thessaloniki</option>
                </select>
            </div>
            <div class="form-group">
                <label for="departureDate" >Ημερομηνία Αναχώρησης:</label>
                    <input type="date" name="departureDate" class="form-control" id="departureDate" placeholder="DD/MM" style="width: 100px;" required>
            </div>
            <button type="submit" class="bt2">Aς ταξιδέψουμε!</button>
        </form>
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