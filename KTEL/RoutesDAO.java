package KTEL;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class RoutesDAO {
    public void addRoute(Routes route) throws Exception {
        String sql = "INSERT INTO Routes (route_id, route, routes_date, travel_time, route_type, seats_count) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = new DB().getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, route.getRouteId());
            pstmt.setString(2, route.getRoute());
            pstmt.setTimestamp(3, route.getRoutesDate());
            pstmt.setTime(4, route.getTravelTime());
            pstmt.setString(5, route.getRouteType());
            pstmt.setInt(6, route.getSeatsCount());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error occurred: " + e.getMessage());
            throw e;
        }
    }

    public List<Routes> findRoute(String route, LocalDate date, String routeType) throws Exception {
        String sql = "SELECT * FROM Routes WHERE route = ? AND DATE(routes_date) = ? AND route_type = ?";
        List<Routes> routesList = new ArrayList<Routes>();
        try (Connection con = new DB().getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, route);//Περνάω στο ερώτημα το rout που στελενετε απο το jsp
            pstmt.setObject(2, date);//Περνάω στο ερώτημα το LocalDate που στελενετε απο το jsp
            pstmt.setString(3, routeType);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int routeId = rs.getInt("routeid");
                    String routeDB = rs.getString("route");
                    Timestamp routesDate = rs.getTimestamp("routes_date");
                    Time travelTime = rs.getTime("travel_time"); 
                    routeType = rs.getString("route_type");
                    int seatsCount = rs.getInt("seats_count");
                    BigDecimal price = rs.getBigDecimal("price");
                    routesList.add(new Routes(routeId, routeDB, routesDate, travelTime, routeType, seatsCount, price));
                }
            }
            return routesList;
        } catch (SQLException e) {
            System.out.println("Error occurred: " + e.getMessage());
            throw e;
        }
    }

    public void deleteRoute(int routeId) throws Exception {
        String sql = "DELETE FROM Routes WHERE route_id = ?";

        try (Connection con = new DB().getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, routeId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error occurred: " + e.getMessage());
            throw e;
        }
    }
}
