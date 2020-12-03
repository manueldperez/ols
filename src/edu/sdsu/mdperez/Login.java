package edu.sdsu.mdperez;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.sdsu.mdperez.dao.LoginDao;

@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		
		LoginDao dao = new LoginDao();
		
				try {
					if (dao.validate(username, passwd)) {
						HttpSession session = request.getSession();
						session.setAttribute("username", username);
						response.sendRedirect("dashboard.jsp");
					}
					else {
						response.sendRedirect("login.jsp");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	}
}
