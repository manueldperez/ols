package edu.sdsu.mdperez.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String USERNAME = "root";
    private static final String PASSWORD = "dbpassword";
    private static final String CONN = "jdbc:mysql://localhost:3306/ols";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(CONN, USERNAME, PASSWORD);
    }
}

/*
public class AccessUsers {

public static void getUsers(ResultSet rs) throws SQLException {
    while (rs.next()) {
        StringBuffer buffer = new StringBuffer();

        buffer.append("Users ID: " + rs.getInt("user_id"));
        buffer.append(" Name:  " + rs.getString("first_name") + " ");
        buffer.append(rs.getString("last_name") + " ");
        buffer.append(" Top Notch Number: " + rs.getInt("top_notch_member_num"));
        buffer.append(" Library Member Number: " + rs.getInt("library_member_num"));
        buffer.append(" Email: " + rs.getString("email"));
        buffer.append(" Overdue Fines: " + rs.getBigDecimal("overdue_fines"));
        buffer.append(" Overdue Materials: " + rs.getInt("materials_overdue_id"));
        buffer.append(" Materials Previously Checked Out: " + rs.getInt("materials_prev_checked_out_id"));
        buffer.append(" Materials Returned ID: " + rs.getInt("materials_returned_id"));
        System.out.println(buffer.toString());
    }
}

}
*/