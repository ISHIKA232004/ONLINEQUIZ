package mypack;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "ishika232004", "ishika123");

			PreparedStatement ps = con.prepareStatement("SELECT username FROM users WHERE email=? AND password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String username = rs.getString("username");

				// Check if already attempted quiz from result table
				PreparedStatement ps2 = con.prepareStatement("SELECT score FROM result WHERE username=?");
				ps2.setString(1, username);
				ResultSet rs2 = ps2.executeQuery();

				if (rs2.next()) {
					int score = rs2.getInt("score");
					if (score > 0) {
						// Already attempted
						response.sendRedirect("login.jsp?attempted=true");
					} else {
						// Allow login
						HttpSession session = request.getSession();
						session.setAttribute("email", email);
						response.sendRedirect("index.jsp");
					}
				} else {
					// First time login, no score yet
					HttpSession session = request.getSession();
					session.setAttribute("email", email);
					response.sendRedirect("index.jsp");
				}

			} else {
				response.sendRedirect("login.jsp?error=invalid");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp?error=exception");
		}
	}
}
