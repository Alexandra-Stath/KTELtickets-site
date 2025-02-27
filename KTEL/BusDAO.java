package KTEL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BusDAO {
    public List<Bus> findBus(int routeId) throws Exception {
        String sql = "SELECT * FROM Bus WHERE route_id = ?";
        List<Bus> busList = new ArrayList<Bus>();
        try (Connection con = new DB().getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, routeId);//Περνάω στο ερώτημα το routId που στελενετε απο το jsp
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int seatNumber = rs.getInt("seat_number");
                    boolean reserved = rs.getBoolean("reserved");
                    busList.add(new Bus(seatNumber, reserved));
                }
            }
            return busList;
        } catch (SQLException e) {
            System.out.println("Error occurred: " + e.getMessage());
            throw e;
        }
    }
}