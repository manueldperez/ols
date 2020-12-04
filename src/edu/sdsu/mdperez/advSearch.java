package edu.sdsu.mdperez;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sdsu.mdperez.dao.DBConnection;


@WebServlet("/AdvSearch")
public class advSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String keyword = request.getParameter("keyword");
		String genre = request.getParameter("genre");
		String extra_genre = request.getParameter("extra_genre");
		String extra_genre2 = request.getParameter("extra_genre2");
		String material_type = request.getParameter("material_type");
		
		String query = "SELECT author, title, genre, extra_genre, extra_genre2, material_type FROM inventory "
				+ "WHERE MATCH(author, title, genre, extra_genre, extra_genre2, material_type) "
				+ "AGAINST('+"+keyword+"' IN BOOLEAN MODE)";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery(query);
			
			while(rs.next()) {
				System.out.println(rs.getString(1) +"\n"+ rs.getString(2) +"\n"+ rs.getString(3));
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
