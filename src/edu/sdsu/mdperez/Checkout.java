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
import java.sql.ResultSet;

import edu.sdsu.mdperez.dao.DBConnection;

@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			int user_id = (int) session.getAttribute("user_id");
			int productId = Integer.parseInt(request.getParameter("product_id"));
			
			String query = "UPDATE inventory SET checked_out_by = "+user_id+", day_checked_out = NOW(), return_date = DATE_ADD(NOW(), INTERVAL 21 DAY) WHERE product_id = " +productId;
			String query3 = "SELECT title FROM inventory WHERE " +productId;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(query3);
			
			ResultSet rs = ps.executeQuery(query3);
			if (rs.next()) {
				session.setAttribute("title", rs.getNString(1));
			}
			
			String query2 = "INSERT checkoutLog SET user_id = "+user_id+", title = \""+ session.getAttribute("title")+"\"";
			
			PreparedStatement ps2 = conn.prepareStatement(query);
			PreparedStatement ps3 = conn.prepareStatement(query2);
			ps2.executeUpdate(query);
			ps3.executeUpdate(query2);
			
			response.sendRedirect("bookshelf.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}
}
