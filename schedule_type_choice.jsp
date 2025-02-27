<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "KTEL.*"%>
<%@ page errorPage="error.jsp"%>
<%



%>
<%
	if (session.getAttribute("userObj2024") != null) {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departureDate = request.getParameter("departureDate");
        String route = from + " - " + to;
%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Select schedule type</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <!-- Custom styles for this template -->
    <link href="css/theme_ismgroup29.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
    <!-- Font Awesome v6.0.0-beta3 CDN link for scalable vector icons (e.g., check, cross) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        html,
        body {
            width: 100%;
            height: 100%;
        }

        .main {
            height: 70%;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        #button1 {
            margin-bottom: 3px;
        }

        .b {
            width: 240px;
            height: 50px;
            /* background-color: hsla(60, 100%, 50%, 0.4); */
            background-color: orange;
            border: none;
            border-radius: 50px;
            font-weight: bold;
        }

        .b:hover {
            /* background-color: rgb(253, 150, 5); */
            background-color: hsl(39, 100%, 40%);
        }
        
        footer {
            color: white;
        }
    </style>

<body>
    <%
        String currentPage = "search";
        %>
        <%@ include file="navbar.jsp" %>
    
    <div class="main">
        <h1 class="header">Επίλεξε είδος δρομολογίου</h1>
        <div class="buttons">
            <!-- Φόρμα για το κουμπί "Απλό" -->
            <form action="schedule_pick_classic.jsp" method="post" style="display:inline;">
                <input type="hidden" name="departureDate" value="<%= departureDate %>">
                <input type="hidden" name="route" value="<%= route %>">
                <button type="submit" class="b" id="button1">Απλό</button>
            </form>
            <br>
            <!-- Φόρμα για το κουμπί "Express" -->
            <form action="schedule_pick_express.jsp" method="post" style="display:inline;">
                <input type="hidden" name="departureDate" value="<%= departureDate %>">
                <input type="hidden" name="route" value="<%= route %>">
                <button type="submit" class="b">Express</button>
            </form>
        </div>        
    </div>
    <!-- footer -->
    <%@ include file="footer.jsp" %>
    <!-- End footer -->
    <script>
        function enableButton_title() {
            const linkbutton = document.getElementById("linkButton");
            linkbutton.classList.add("enabled");
        }
    </script>
</body>

</html>

<%
	} else {
%>
        <jsp:forward page="login.jsp" />
<%
    }
%>