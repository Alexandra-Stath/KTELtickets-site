package KTEL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CardsDAO {

    public Cards authenticate(String cnumber, String expdate, int cvv, String cholder) throws Exception {

        DB db = new DB();
        Connection connect = null;
        PreparedStatement pstate = null;
        ResultSet result = null;
        Cards card = null;

        try {
            connect = db.getConnection();
            String query = "SELECT * FROM Cards WHERE card_number=? AND expiry_date=? AND cvv=? AND holder_name=?";
            pstate = connect.prepareStatement(query);
            pstate.setString(1, cnumber);
            pstate.setString(2, expdate);
            pstate.setInt(3, cvv);
            pstate.setString(4, cholder);
            result = pstate.executeQuery();

            if (!result.next()) {

                throw new Exception("No card with those credentials found.");
            }

            card = new Cards(
                    result.getString("card_number"),
                    result.getString("expiry_date"),
                    result.getInt("cvv"),
                    result.getString("holder_name"),
                    result.getDouble("amount"));

        } catch (Exception e) {
            throw new Exception(e.getMessage());

        } finally {
            result.close();
            pstate.close();
            db.close();

        }

        return card;

    }

}
