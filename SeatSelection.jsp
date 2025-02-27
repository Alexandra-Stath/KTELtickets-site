<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "KTEL.*, java.util.ArrayList"%>
<%@ page errorPage="error.jsp"%>

<%
ArrayList<Bus> seats;
String route, routesDate, price;
if (session.getAttribute("userObj2024") != null) {
    if (request.getParameter("routeId") != null) {
        route = request.getParameter("selectedRouteRadio");
        routesDate = request.getParameter("routeDate");
        price = request.getParameter("price");
        int routeId = Integer.parseInt(request.getParameter("routeId"));
        BusDAO busDAO = new BusDAO();
        seats = (ArrayList<Bus>)busDAO.findBus(routeId);
    } else {%>
        <jsp:forward page="Search1.jsp" />
    <%}
} else {%>
    <jsp:forward page="login.jsp" />
<%}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/SeatSelection.css" rel="stylesheet">
    <title>e-Ticket</title>
</head>

<body>
    <header>
        <%
        String currentPage = "seats";
        %>
        <%@ include file="navbar.jsp" %>

        
    </header>
    <main>
        <div class="wrapper">
            <div class="travel-info">
                <h1><!-- ΑΘΗΝΑ (ΑΡ) - ΘΕΣΣΑΛΟΝΙΚΗ (ΜΑ) --><%=route%></h1>
                <div class="date">
                    <p><!-- Πέμπτη, 31-10-2024 --><%=routesDate%></p>
                    <!-- <p>13:00</p> -->
                </div>
            </div>
            <div class="selected-seats">
                <p><span class="seats-length">0</span> Επιλεγμένες Θέσεις <span class="sel-seats"></span></p>
            </div>
            <div class="info">
                <div class="bus">
                    <div class="seats">
                        <div class="top">
                            <div class="first-row">
                                <%for (int i = 45; i > 0; i -= 4) {%>
                                    <div <%if(seats.get(i - 1).reserved()){%> class="seat reserved" <%}else{%> class="seat" <%}%>>
                                        <%=seats.get(i - 1).seatNumber()%>
                                    </div>
                                <%}%>
                            </div>
                            <div class="second-row">
                                <%for (int i = 46; i > 0; i -= 4) {%>
                                    <div <%if(seats.get(i - 1).reserved()){%> class="seat reserved" <%}else{%> class="seat" <%}%>>
                                        <%=seats.get(i - 1).seatNumber()%>
                                    </div>
                                <%}%>
                            </div>
                        </div>
                        <div <%if(seats.get(47 - 1).reserved()){%> class="seat reserved" <%}else{%> class="seat" <%}%>>
                            <%=seats.get(47 - 1).seatNumber()%>
                        </div>
                        <div class="bottom">
                            <div class="third-row">
                                <%for (int i = 47; i > 0; i -= 4) {%>
                                    <div <%if(seats.get(i - 1).reserved()){%> class="seat reserved" <%}else{%> class="seat" <%}%>>
                                        <%if(i == 47){%>
                                            <%=seats.get(i).seatNumber()%>
                                        <%} else {%>
                                            <%=seats.get(i - 1).seatNumber()%>
                                        <%}%>
                                    </div>
                                <%}%>
                            </div>
                            <div class="fourth-row">
                                <%for (int i = 48; i > 0; i -= 4) {%>
                                    <div <%if(seats.get(i - 1).reserved()){%> class="seat reserved" <%}else{%> class="seat" <%}%>>
                                        <%if(i == 48){%>
                                            <%=seats.get(i).seatNumber()%>
                                        <%} else {%>
                                            <%=seats.get(i - 1).seatNumber()%>
                                        <%}%>
                                    </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="example">
                    <div class="exa">
                        <div class="ex ex1"></div>
                        <p>Διαθέσιμη</p>
                    </div>
                    <div class="exa">
                        <div class="ex ex2"></div>
                        <p>Επιλεγμένη</p>
                    </div>
                    <div class="exa">
                        <div class="ex ex3"></div>
                        <p>Μη Διαθέσιμη</p>
                    </div>
                </div>
            </div>
        </div>

        <form id="seatsForm" onsubmit="event.preventDefault()" action="SeatsInfo.jsp" method="post">
            <input type="hidden" id="seatsInput" name="selectedSeats">
            <input type="hidden" id="route" name="route" value="<%=route%>">
            <input type="hidden" id="routeDate" name="routeDate" value="<%=routesDate%>">
            <input type="hidden" id="price" name="price" value="<%=price%>">
            <div class="button-container">
                <button class="button">Συνέχεια</button>
            </div>
        </form>      
    </main>

    <%@ include file="footer.jsp" %>
</body>
<script src="./js/SeatSelection.js"></script>

</html>