package edu.sdsu.mdperez;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sdsu.mdperez.dao.DBConnection;

@WebServlet("/Signup")
public class Signup extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		
		//String addQuery1 = "INSERT INTO users (first_name, last_name, email) VALUES ( ('"+first_name+"'), ('"+last_name+"'), ('"+email+"') )";
		String addQuery2 = "INSERT INTO user_login (username, password) VALUES ( ('"+username+"'), ('"+passwd+"') )";
		
		if(first_name.isEmpty() || last_name.isEmpty() || username.isEmpty() || 
			passwd.isEmpty() || email.isEmpty()) 
		{
			
			RequestDispatcher req = request.getRequestDispatcher("Signup.jsp");
			req.include(request, response);
			
		}
		else {
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DBConnection.getConnection();
				
				PreparedStatement stmt = conn.prepareStatement(addQuery2);
//				Statement st = conn.createStatement();
				//st.executeQuery(addQuery1);
				stmt.executeUpdate(addQuery2);
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
