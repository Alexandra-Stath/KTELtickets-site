<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "KTEL.*"%>
<%@ page errorPage="error.jsp"%>

<%
String[] selectedSeats;
String route, routeDate, price;
if (session.getAttribute("userObj2024") != null) {
    if (request.getParameter("selectedSeats") != null) {
        route = request.getParameter("route");
        routeDate = request.getParameter("routeDate");
        price = request.getParameter("price");
        selectedSeats = request.getParameter("selectedSeats").split(",");
        
        session.setAttribute("date", routeDate);
        session.setAttribute("route", route);
        session.setAttribute("seats", selectedSeats);
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
    <link href="css/SeatsInfo.css" rel="stylesheet">
    <title>Checkout</title>
</head>

<body>
        <%
        String currentPage = "seats";
        %>
        <%@ include file="navbar.jsp" %>

    <main>
        <div class="container">
            <div class="tickets">
                <p class="h">ΕΠΙΒΑΤΕΣ ΚΑΙ ΤΥΠΟΙ ΕΙΣΙΤΗΡΙΩΝ</p>
                <%for (int i = 0; i < selectedSeats.length; i++ ) {%>
                    <div class="form">
                        <div class="seat">
                            <p>Θέση:</p>
                            <p class="num"><%=selectedSeats[i]%></p>
                        </div>
                        <div class="name name<%=i%>">
                            <label for="name<%=i%>">ΟΝ/ΝΥΜΟ ΕΠΙΒΑΤΗ:*</label>
                            <input class="names" type="text" id="name">
                        </div>
                        <div class="ticket">
                            <label for="tic tic<%=i%>">ΤΥΠΟΣ ΕΙΣΙΤΗΡΙΟΥ:*</label>
                            <select class="tics" name="ticket" id="tic<%=i%>">
                                <option value="1">Ολόκληρο</option>
                                <option value="2">Φοιτητικό/Στρατιωτικό</option>
                                <option value="3">Μισό/Φοιτητικό</option>
                            </select>
                        </div>
                    </div>
                <%}%>
            </div>
            <div class="drom">
                <p class="h">ΔΡΟΜΟΛΟΓΙΟ</p>
                <div class="drom-info">
                    <p><!-- ΑΝΑΧΩΡΗΣΗ: ΑΘΗΝΑ (ΑΡ) - ΘΕΣΣΑΛΟΝΙΚΗ (ΜΑ) --><%=route%></p>
                    <p><!-- 22:30 --><%=routeDate%></p>
                </div>
            </div>
            <div class="total">
                <p class="h">ΣΥΝΟΛΟ</p>
                <div class="tickets-total">
                    <p>ΑΡΙΘΜΟΣ ΕΙΣΙΤΗΡΙΩΝ: <%=selectedSeats.length%></p>
                    <p><span class="finalPrice"></span> €</p>
                </div>
            </div>
            <div class="pay-container">
                <label class="terms">
                    <input class="checkbox" type="checkbox"> Αποδέχομαι τους ΟΡΟΥΣ ΧΡΗΣΗΣ</a>
                </label>
                <form id="clform" action="payment_method.jsp" onsubmit="event.preventDefault()" method="post">
                    <input type="hidden" id="prc" name="price">
                    <button class="pay button">ΠΛΗΡΩΜΗ</button>
                </form>
            </div>
        </div>
    </main>
    <script>
        //Price
        const finalPrice = document.querySelector(".finalPrice");
        const tickets = document.querySelectorAll(".tics");
        let price = [], fprice = 0;
        tickets.forEach(ticket => price.push(Number(ticket.value) === 3 ? 0.5 : Number(ticket.value) === 2 ? 0.75 : 1));
        finalPrice.innerHTML = price.reduce((acc, num) => acc + num * Number("<%=price%>"), 0);
        tickets.forEach((ticket, i) => ticket.addEventListener("change", () => {
            price[i] = Number(ticket.value) === 3 ? 0.5 : Number(ticket.value) === 2 ? 0.75 : 1;
            console.log(price);
            fPrice = price.reduce((acc, num) => acc + num * Number("<%=price%>"), 0);
            finalPrice.innerHTML = fPrice;
        }));

        //Check for names
        const names = document.querySelectorAll(".names");
        const button = document.querySelector(".button");
        const checkbox = document.querySelector(".checkbox");
        let validNames = 0, valid = false, validCheckbox;
        button.addEventListener("click", () => {
            validNames = 0;
            names.forEach(name => {if (name.value !== "") {validNames++}});
            valid = validNames === names.length ? true : false;
            validCheckbox = checkbox.checked;

            if (valid && validCheckbox) {
                document.getElementById('prc').value = finalPrice.innerHTML;
                document.getElementById('clform').submit();
            } else if (valid) {
                alert("Πρέπει να αποδεχτείτε τους όρους χρήσης.");
            } else if (validCheckbox) {
                alert("Τα ονοματεπώνυμα επιβατών δεν πρέπει να είναι κενά.");
            } else {
                alert("Πρέπει να αποδεχτείτε τους όρους χρήσης.\nΤα ονοματεπώνυμα επιβατών δεν πρέπει να είναι κενά.");
            }
        });
    </script>

    <%@ include file="footer.jsp" %>
</body>

</html>