package edu.sdsu.mdperez.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String USERNAME = "root";
    private static final String PASSWORD = "M1!a2@n3#";
    private static final String CONN = "jdbc:mysql://localhost:3306/ols";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(CONN, USERNAME, PASSWORD);
    }
}