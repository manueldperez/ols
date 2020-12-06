package edu.sdsu.mdperez.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class accessType {
	
	String query = "SELECT access_type FROM users WHERE user_id=?";

	public String userAccess(int user_id) throws SQLException {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getNString(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
