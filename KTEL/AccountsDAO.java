package KTEL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountsDAO {
    public void registerAccount(Accounts account) throws Exception {
        String sql = "INSERT INTO Accounts (user_name, user_password, email) VALUES (?, ?, ?)";

        try (Connection con = new DB().getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, account.getUserName());
            pstmt.setString(2, account.getUserPassword());
            pstmt.setString(3, account.getEmail());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error occurred: " + e.getMessage());
            throw e;
        }
    }

    public void insertAccount(Accounts account) throws DuplicateFieldException, Exception {

        DB db = new DB();
        Connection con = null;
        String sql = "INSERT INTO Accounts (user_name, user_password, email) VALUES (?, ?, ?)";

        try {

            con = db.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);

            // setting parameters
            pstmt.setString(1, account.getUserName());
            pstmt.setString(2, account.getUserPassword());
            pstmt.setString(3, account.getEmail());

            pstmt.executeUpdate();

            pstmt.close();
            db.close();
        } catch (SQLIntegrityConstraintViolationException e) {
            if (e.getMessage().contains("PRIMARY")) {
                throw new DuplicateFieldException("The username already exists.");
            } else if (e.getMessage().contains("email_UNIQUE")) {
                throw new DuplicateFieldException("The email already exists.");
            } else {
                throw new Exception("Integrity constraint violation: " + e.getMessage());
            }
        } catch (Exception e) {
            throw new Exception("Error occurred: " + e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }

        }

    }

    public Accounts findAccount(String userName) throws Exception {
        String sql = "SELECT * FROM Accounts WHERE user_name = ?";

        try (Connection con = new DB().getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String userPassword = rs.getString("user_password");
                    String email = rs.getString("email");
                    return new Accounts(userName, userPassword, email);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error occurred: " + e.getMessage());
            throw e;
        }
        return null;
    }

    public void deleteAccount(String userName) throws Exception {
        String sql = "DELETE FROM Accounts WHERE user_name = ?";

        try (Connection con = new DB().getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error occurred: " + e.getMessage());
            throw e;
        }
    }

    public List<Accounts> getAllAccounts() throws Exception {
        String sql = "SELECT * FROM Accounts";
        List<Accounts> accountsList = new ArrayList<>();

        try (Connection con = new DB().getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String userName = rs.getString("user_name");
                String userPassword = rs.getString("user_password");
                String email = rs.getString("email");
                accountsList.add(new Accounts(userName, userPassword, email));
            }
        } catch (SQLException e) {
            System.out.println("Error occurred: " + e.getMessage());
            throw e;
        }
        return accountsList;
    }

    public Accounts authenticate(String username, String password) throws Exception {

        DB db = new DB();
        Connection connect = null;
        PreparedStatement pstate = null;
        ResultSet result = null;
        Accounts account = null;

        try {
            connect = db.getConnection();
            String query = "SELECT * FROM Accounts WHERE user_name=? AND user_password=?";
            pstate = connect.prepareStatement(query);
            pstate.setString(1, username);
            pstate.setString(2, password);
            result = pstate.executeQuery();

            if (!result.next()) {

                throw new Exception("Wrong username or password.");
            }

            account = new Accounts(
                    result.getString("user_name"),
                    result.getString("user_password"),
                    result.getString("email"));

        } catch (Exception e) {
            throw new Exception(e.getMessage());

        } finally {
            result.close();
            pstate.close();
            db.close();

        }

        return account;

    } // End of authenticate
}
