package edu.sdsu.mdperez;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sdsu.mdperez.dao.DBConnection;

@WebServlet("/simpleSearch")
public class simpleSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("simpleSearch");
		
		String query = "SELECT * "
				+ "FROM inventory WHERE MATCH(author, title, genre, extra_genre, extra_genre2) "
				+ "AGAINST('+"+keyword+"')";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery(query);
			
			while(rs.next()) {
				response.sendRedirect("results.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
