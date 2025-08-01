package mypack;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","password");

            Connection con = DriverManager.getConnection("jdbc:mysql://sql7.freesqldatabase.com:3306/sql7793099", "sql7793099", "9YLUCexPD8");
            // Check if user already exists
            PreparedStatement check = con.prepareStatement("SELECT * FROM users WHERE username=?");
            check.setString(1, user);
            ResultSet rs = check.executeQuery();

            if(rs.next()) {
                response.sendRedirect("login.jsp?msg=Username already exists");
            } else {
                PreparedStatement ps = con.prepareStatement("INSERT INTO users(username,email,password) VALUES(?,?,?)");
                ps.setString(1, user);
                ps.setString(2, email);
                ps.setString(3, pass);
                ps.executeUpdate();

                // ✅ Directly log the user in after registration
                HttpSession session = request.getSession();
                session.setAttribute("username", user);
                response.sendRedirect("index.jsp");
            }

            rs.close();
            check.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
