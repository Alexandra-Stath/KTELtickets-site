<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Error page">
        <meta name="author" content="Alexandra Stathopoulou">

        <title>KTELtickets - Error Page</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Bootstrap Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <!-- Custom styles for this template -->
        <link href="css/theme_ismgroup29_login.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>

    <body>


        <div class="container">
            <div class="page-header">
                <h1>Oops something went wrong</h1>
            </div>

            <div class="row">

                <div class="col-xs-12">

                    <h2>Description</h2>

                    <% if(exception != null) { %>	                  	
                        <p class="exception-message">
                            <code><%=exception %></code>
                        </p>						
                    <% } %>		

                </div>
            </div>
        </div>        

        <%@ include file="footer.jsp" %>
    </body>
</html>
