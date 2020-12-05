package edu.sdsu.mdperez;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.sdsu.mdperez.dao.LoginDao;
import edu.sdsu.mdperez.dao.accessType;

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
				accessType acctype = new accessType();
				String user_access = acctype.userAccess(user_id);
				session.setAttribute("user_access", user_access);
				if (user_access.equals("Patron")) {
					response.sendRedirect("patronDashboard.jsp");
				}
				else if(user_access.equals("Staff")) {
					response.sendRedirect("staffDashboard.jsp");
				}
			}
			else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}