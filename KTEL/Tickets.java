package KTEL;

import java.math.BigDecimal;

public class Tickets {
    private int ticketId;
    private int seatNumber;
    private String route;
    private String email;
    private BigDecimal price;
    private String passengerName;

    public Tickets(int ticketId, int seatNumber, String route, String email, BigDecimal price, String passengerName) {
        this.ticketId = ticketId;
        this.seatNumber = seatNumber;
        this.route = route;
        this.email = email;
        this.price = price;
        this.passengerName = passengerName;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }
}