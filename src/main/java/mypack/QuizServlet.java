package mypack;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ArrayList<Question> questions = new ArrayList<>();

        String selectedLang = request.getParameter("language");

        if (selectedLang != null && !selectedLang.trim().isEmpty()) {
            session.setAttribute("language", selectedLang);
        } else {
            selectedLang = (String) session.getAttribute("language");
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student", "root", "password"
            );

            PreparedStatement ps;
            if (selectedLang != null && !selectedLang.trim().isEmpty()) {
                ps = con.prepareStatement("SELECT * FROM question WHERE language = ? LIMIT 20");
                ps.setString(1, selectedLang);
            } else {
                ps = con.prepareStatement("SELECT * FROM question LIMIT 20");
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Question q = new Question(
                        rs.getInt("Id"),
                        rs.getString("Question"),
                        rs.getString("Option1"),
                        rs.getString("Option2"),
                        rs.getString("Option3"),
                        rs.getString("Option4"),
                        rs.getString("Correct_ans")
                );
                questions.add(q);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("questions", questions);
        session.setAttribute("questions", questions);

        RequestDispatcher rd = request.getRequestDispatcher("quiz.jsp");
        rd.forward(request, response);
    }
}
