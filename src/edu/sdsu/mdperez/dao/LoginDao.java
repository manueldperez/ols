package edu.sdsu.mdperez.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class LoginDao {
	
	String query = "SELECT user_id FROM users WHERE username=? and password=?";

	public int validate(String username, String passwd) throws SQLException {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, passwd);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getInt(1));
				return rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
}
/*
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
}*/