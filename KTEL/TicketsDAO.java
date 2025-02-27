package KTEL;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TicketsDAO {
    public int addTicket(String[] seatNumber, String route, String email, String price) throws Exception {
        String sql = "INSERT INTO Tickets (seat_number, route, email, price) VALUES (?, ?, ?, ?)";
        BigDecimal bigDecimalValue = new BigDecimal(price);

        // Trim whitespaces from each seatNumber entry
        String[] trimmedSeatNumbers = Arrays.stream(seatNumber)
                .map(String::trim) // Trim each seat number
                .toArray(String[]::new);

        // Join the seat numbers after trimming
        String result = String.join(", ", trimmedSeatNumbers);

        int ticketID = -1; // Default value in case no ID is generated

        try (Connection con = new DB().getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Set parameters for the SQL statement
            pstmt.setString(1, result); // Seat numbers after trimming
            pstmt.setString(2, route);
            pstmt.setString(3, email);
            pstmt.setBigDecimal(4, bigDecimalValue);

            // Execute update (insert)
            pstmt.executeUpdate();

            // Get the generated keys (ticketID)
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) {
                    ticketID = rs.getInt(1); // Get the first generated key, which is the ticketID
                }
            }
        } catch (SQLException e) {
            System.out.println("Error occurred: " + e.getMessage());
            throw e;
        }

        return ticketID; // Return the generated ticketID
    }

    public void updateSeats(String[] seatNumber) throws Exception {
        String sql = "UPDATE Bus SET reserved = TRUE WHERE seat_number = ?";
        List<Integer> intList = new ArrayList<>();
        for (String str : seatNumber) {
            intList.add(Integer.parseInt(str.trim()));
        }
        for (int i : intList) {
            try (Connection con = new DB().getConnection();
                    PreparedStatement pstmt = con.prepareStatement(sql)) {
                pstmt.setInt(1, i);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error occurred: " + e.getMessage());
                throw e;
            }
        }

    }
}
