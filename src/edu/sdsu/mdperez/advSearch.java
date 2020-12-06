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
		String material_type = request.getParameter("material_type");
		
		String query = "SELECT author, title, publisher, genre, extra_genre, extra_genre2, material_type "
				+ "FROM inventory "
				+ "WHERE MATCH(author, title, publisher, genre, extra_genre, extra_genre2, material_type) "
				+ "AGAINST(\""+author+" "+title+" "+keyword+" "+genre+" "+material_type+"\" IN BOOLEAN MODE)";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery(query);
			
			while(rs.next()) {
				System.out.println(rs.getNString(1) +" "+ rs.getNString(2) +" "+ rs.getNString(3) +" "+
								   rs.getNString(4) +" "+ rs.getNString(5) +" "+ rs.getNString(6) +" "+
								   rs.getNString(7));
			}
			
			if (author.isBlank() && title.isBlank() && keyword.isBlank() && genre.isBlank() && 
				material_type.isBlank()) {
				response.sendRedirect("advSearch.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
