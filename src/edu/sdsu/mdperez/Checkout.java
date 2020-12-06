package edu.sdsu.mdperez;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;

import edu.sdsu.mdperez.dao.DBConnection;

@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int user_id = (int) session.getAttribute("user_id");
		int productId = Integer.parseInt(request.getParameter("product_id"));
		
		String query = "UPDATE inventory SET checked_out_by = "+user_id+" WHERE product_id = " +productId;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.executeUpdate(query);
			
			response.sendRedirect("bookshelf.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}
}
