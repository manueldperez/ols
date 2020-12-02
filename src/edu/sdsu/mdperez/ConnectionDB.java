package database;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class ConnectionDB {

    public static void main(String[] args) throws SQLException {

        try (
                Connection con = DBConnection.getConnection();
                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

                ResultSet rsGetUser = stmt.executeQuery("SELECT * FROM users");
                )
        {
            System.out.println("Connected!");

            //AddUser.createUser();
            AccessUsers.getUsers(rsGetUser);

        } catch (SQLException e) {
            System.err.print(e);
        }

    }
}