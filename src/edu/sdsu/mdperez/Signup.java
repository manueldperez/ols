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

@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		String accessType = request.getParameter("accessType");
		
		String addQuery = "INSERT INTO users (first_name, last_name, username, password, email, access_type) "
				+ "VALUES ( ('"+first_name+"'), ('"+last_name+"'), ('"+username+"'), ('"+passwd+"'), ('"+email+"'), ('"+accessType+"') )";
		
		if(first_name.isEmpty() || last_name.isEmpty() || username.isEmpty() || 
			passwd.isEmpty() || email.isEmpty() || accessType.isEmpty()) 
		{
			
			RequestDispatcher req = request.getRequestDispatcher("signup.jsp");
			req.include(request, response);
			
		}
		else {
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DBConnection.getConnection();
				
				PreparedStatement ps = conn.prepareStatement(addQuery);
				ps.executeUpdate(addQuery);
				//System.out.println(i);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("login.jsp");
			
			
			/*
			  try (Connection conn = DBConnection.getConnection()) {

            
            stmt.execute(sql);
            //Statement stmt = conn.createStatement();

            //stmt.executeUpdate("INSERT INTO users (first_name) VALUES (users ('test'))");

        } catch (Exception e) {
            System.err.println(e);
        }
			 */
			
		}
		
	}
}
