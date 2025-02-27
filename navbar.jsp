<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "KTEL.*"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.*" %>

<%
    Accounts account = (Accounts) session.getAttribute("userObj2024"); 
    String prof_username = account.getUserName();
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

        <!-- Font Awesome v6.0.0-beta3 CDN link for scalable vector icons (e.g., check, cross) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<title>Search Page</title>
    </head>
    <style>
    body {
        background-color: #efefef !important; 
    }
    .visited a {
        color: green !important;
    }
    nav .nav li:not(.active):not(.visited) a {
        color:  rgb(187, 187, 187) !important; 
    }
    </style>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">KTELtickets</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="<%= currentPage.equals("login") ? "active" : currentPage.equals("Happy travels!") || currentPage.equals("search") || currentPage.equals("routes") || currentPage.equals("seats") || currentPage.equals("payment") ? "visited" : "" %>">
                            <a>Login</a>
                        </li>
                        <li class="<%= currentPage.equals("search") ? "active" : currentPage.equals("Happy travels!") || currentPage.equals("routes") || currentPage.equals("seats") || currentPage.equals("payment") ? "visited" : "" %>">
                            <a>Search</a>
                        </li>
                        <li class="<%= currentPage.equals("routes") ? "active" : currentPage.equals("Happy travels!") || currentPage.equals("seats") || currentPage.equals("payment") ? "visited" : "" %>">
                            <a>Routes</a>
                        </li>
                        <li class="<%= currentPage.equals("seats") ? "active" : currentPage.equals("Happy travels!") || currentPage.equals("payment") ? "visited" : "" %>">
                            <a>Seats</a>
                        </li>
                        <li class="<%= currentPage.equals("payment") ? "active": currentPage.equals("Happy travels!") ? "visited" : "" %>">
                            <a>Payment</a>
                        </li>
                        <li class="<%= currentPage.equals("Happy travels!") ? "active" : "" %>">
                            <a>Happy travels!</a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
							<p class="navbar-text">Signed in as <%=prof_username %></p>
						</li>
						<li>
							<a href="logout.jsp"><i class="fas fa-right-from-bracket"></i> Sign out</a>
						</li>								        	
			        </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </nav>
    </body>
</html>