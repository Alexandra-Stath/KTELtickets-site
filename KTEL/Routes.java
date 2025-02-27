package KTEL;

import java.math.BigDecimal;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class Routes {
    private int routeId;
    private String route;
    private Timestamp routesDate;
    private Time travelTime;
    private String routeType;
    private int seatsCount;
    private BigDecimal price;

    public Routes(int routeId, String route, Timestamp routesDate, Time travelTime, String routeType, int seatsCount, BigDecimal price) {
        this.routeId = routeId;
        this.route = route;
        this.routesDate = routesDate;
        this.travelTime = travelTime;
        this.routeType = routeType;
        this.seatsCount = seatsCount;
        this.price = price;
    }


    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public Timestamp getRoutesDate() {
        return routesDate;
    }

    public void setRoutesDate(Timestamp routesDate) {
        this.routesDate = routesDate;
    }

    public Time getTravelTime() {
        return travelTime;
    }

    public void setTravelTime(Time travelTime) {
        this.travelTime = travelTime;
    }

    public String getRouteType() {
        return routeType;
    }

    public void setRouteType(String routeType) {
        this.routeType = routeType;
    }

    public int getSeatsCount() {
        return seatsCount;
    }

    public void setSeatsCount(int seatsCount) {
        this.seatsCount = seatsCount;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public LocalDate getDate() {
        LocalDate date = getRoutesDate().toLocalDateTime().toLocalDate();
        //Εξάγουμε μόνο την ημερομηνία από το @RoutesDate
        return date;
    }

    public String getRoutesDateAsString() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return routesDate.toLocalDateTime().format(formatter);
    }

    public String getPriceAsString() {
        return price.toString();
    }        

    public LocalTime getDepartureTime() {
        LocalTime departureTime = getRoutesDate().toLocalDateTime().toLocalTime();
        //Εξάγουμε την ώρα από τη μεταβλητή @routesDate
        return departureTime;
    }

    public LocalTime getArrivalTime() {
        LocalTime departureTime = getRoutesDate().toLocalDateTime().toLocalTime();
        //Εξάγουμε την ώρα από τη μεταβλητή @routesDate
        LocalTime travelTime = getTravelTime().toLocalTime();
        //Μετατρέπουμε την @travelTime από Time σε LocalTime
        //ωστέ να μπορώ να την αθρίσω με την @routesDate
        LocalTime arrivalTime = departureTime.plusHours(travelTime.getHour())
        .plusMinutes(travelTime.getMinute())
        .plusSeconds(travelTime.getSecond());
        //Αθρίζω την ώρα αναχώρησης με την διάρκια του ταξιδιού
        return arrivalTime;
    }
}
