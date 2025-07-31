package mypack;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","password");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                HttpSession session = request.getSession(); // ✅ Ensures session starts
                session.setAttribute("username", user);     // ✅ Stores user in session
                response.sendRedirect("index.jsp");         // ✅ Goes to quiz page
            } else {
                response.sendRedirect("login.jsp?error=Invalid Credentials");
            }

            rs.close();
            ps.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
