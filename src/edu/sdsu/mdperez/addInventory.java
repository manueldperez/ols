package edu.sdsu.mdperez;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sdsu.mdperez.dao.DBConnection;

@WebServlet("/addInventory")
public class addInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String message = request.getParameter("message");
		String publisher = request.getParameter("publisher");
		String material_type = request.getParameter("material_type");
		String release_date = request.getParameter("release_date");
		Double fileSize  = Double.parseDouble(request.getParameter("fileSize"));
		String ISBN = request.getParameter("ISBN");
		String genre = request.getParameter("genre");
		String extra_genre = request.getParameter("extra_genre");
		String extra_genre2 = request.getParameter("extra_genre2");
		String category = request.getParameter("category");
		String img = request.getParameter("img");
		String digRightsInfo = request.getParameter("digRightsInfo");
		
		String addQuery = "INSERT INTO inventory (title, author, book_desc, publisher, material_type, "
				+ "release_date, file_size, ISBN, genre, extra_genre, extra_genre2, category, "
				+ "book_cover_img, dig_rights_info) VALUES ( ('"+title+"'), ('"+author+"'), "
				+ "('"+message+"'), ('"+publisher+"'), ('"+material_type+"'), ('"+release_date+"'), "
				+ "('"+fileSize+"'), ('"+ISBN+"'), ('"+genre+"'), ('"+extra_genre+"'), ('"+extra_genre2+"'), "
				+ "('"+category+"'), ('"+img+"'), ('"+digRightsInfo+"') )";
		
		if(title.isEmpty() || author.isEmpty() || message.isEmpty() || 
				publisher.isEmpty() || material_type.isEmpty() || release_date.isEmpty() ||
				genre.isEmpty() || category.isEmpty())
			{
				RequestDispatcher req = request.getRequestDispatcher("addInventory.jsp");
				req.include(request, response);
			}
			else {
				
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DBConnection.getConnection();
					
					PreparedStatement ps = conn.prepareStatement(addQuery);
					ps.executeUpdate(addQuery);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				response.sendRedirect("staffDashboard.jsp");
				
			}
		

	}

}
