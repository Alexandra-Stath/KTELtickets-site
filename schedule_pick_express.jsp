<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "KTEL.*, java.time.LocalDate, java.util.*, java.time.format.DateTimeFormatter, java.text.SimpleDateFormat, java.text.ParseException"%>
<%@ page errorPage="error.jsp"%>

<%
    if (session.getAttribute("userObj2024") != null) {
        String route = request.getParameter("route");
        String departureDate = request.getParameter("departureDate");

        if (route == null || route.isEmpty() || departureDate == null || departureDate.isEmpty()) {
            response.sendRedirect("error.jsp");
            return;
        }

        RoutesDAO dao = new RoutesDAO();
        List<Routes> routes = null;

        try {
            routes = dao.findRoute(route, departureDate, "express");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Select Itineraries</title> 

        <link href="css/theme_ismgroup29_schedule_pick.css" rel="stylesheet">
    </head>
    <body>
        <%
        String currentPage = "routes";
        %>        
        <!-- Fixed navbar -->
        <%@ include file="navbar.jsp" %>

        <!-- Schedule choices -->
        <div class="title-and-button-space">
            <div class="body-title">
                <h1>Επιλογή Δρομολογίου</h1>
                <h3>Ημερομηνία: <%= departureDate %> <%= route %></h3>
            </div>
            <div class="button-and-price">
                <div class="price-box" id="priceBox">
                    <p>Τιμή: <span id="priceDisplay"> </span> €</p>
                </div>
                <div class="title-button">
                    <a id="linkButton" href="javascript:void(0);" class="title-button" onclick="submitForm()">Συνέχεια</a>
                </div>
            </div>
        </div>
        <br><br>
        <div class="choices-body">
            <form id="selectionForm" action="SeatSelection.jsp" method="POST">
                <input type="hidden" name="routeId" id="routeId">
                <input type="hidden" name="price" id="price">
                <input type="hidden" name="routeDate" id="routeDate">

                <% 
                if (routes.isEmpty()) { 
                %>
                    <jsp:forward page="notfoundRoutes.jsp"/>
                <% 
                    } else {
                        for (Routes list : routes) {
                %>
                            <div class="box-flex">
                                <div class="button-box">
                                    <input type="radio" name="selectedRouteRadio" 
                                           value="<%= list.getRoute() %>" 
                                           onclick="enableButton_title(this, '<%= list.getRouteId() %>', '<%= list.getPriceAsString() %>', '<%= list.getRoutesDateAsString() %>')">
                                </div>
                                <div class="box">
                                    <div class="loc1">
                                        <h1><%= list.getDepartureTime() %></h1>
                                        <p>ΑΝΑΧΩΡΗΣΗ</p>
                                    </div>
                                    <h1><i class="fa fa-arrow-right" aria-hidden="true"></i></h1>
                                    <div class="loc2">
                                        <h1><%= list.getArrivalTime() %></h1>
                                        <p>ΑΦΙΞΗ</p><br><br>
                                    </div>
                                </div>
                            </div>
                <% 
                        } 
                    }
                %>            
            </form>            
        </div>

        <!-- footer -->
        <%@ include file="footer.jsp" %>
        <br><br>

        <script>
            function enableButton_title(selectedRadio, routeId, price, routeDate) {
                document.getElementById("routeId").value = routeId;
                document.getElementById("price").value = price;
                document.getElementById("routeDate").value = routeDate;
                
                const continueButton = document.getElementById("linkButton");
                if (selectedRadio.checked) {
                    continueButton.classList.add("enabled");  // Enable "Continue" button
                } else {
                    continueButton.classList.remove("enabled");  // Disable "Continue" button
                }

                // Update the price display dynamically
                document.getElementById("priceDisplay").textContent = price;
            }

            function submitForm() {
                document.getElementById("selectionForm").submit();
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
