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
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		
		LoginDao dao = new LoginDao();
		
				try {
					int user_id = dao.validate(username, passwd);
					if (user_id != -1) {
						HttpSession session = request.getSession();
						session.setAttribute("username", username);
						session.setAttribute("user_id", user_id);
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