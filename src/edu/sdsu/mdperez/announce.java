package edu.sdsu.mdperez;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.sdsu.mdperez.dao.DBConnection;

@WebServlet("/announce")
public class announce extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String message = request.getParameter("message");
		int user_id;

		HttpSession session = request.getSession();
		user_id = (int) session.getAttribute("user_id");
		
		String query = "INSERT INTO announcement (user_id, title, announcement_text) "
				+ "VALUES ( ('"+user_id+"'), ('"+title+"'), ('"+message+"') )";
		
		try {
			if (title.isEmpty() || message.isEmpty()) {
				//Output something on the screen to say 
				response.sendRedirect("announcement.jsp");
			}
			else {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DBConnection.getConnection();
				
				PreparedStatement ps = conn.prepareStatement(query);
				ps.executeUpdate(query);
				
				response.sendRedirect("staffDashboard.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
