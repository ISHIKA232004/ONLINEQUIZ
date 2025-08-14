package mypack;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

public class SubmitQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        @SuppressWarnings("unchecked")
        ArrayList<Question> questions = (ArrayList<Question>) session.getAttribute("questions");

        int score = 0;

        if (questions != null) {
            for (Question q : questions) {
                String userAnswer = request.getParameter("q" + q.getId());
                String correctAnswer = q.getAnswer();

                if (userAnswer != null && correctAnswer != null) {
                    if (userAnswer.trim().equalsIgnoreCase(correctAnswer.trim())) {
                        score++;
                    }
                }
            }
        }

        boolean alreadyPassed = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");

            PreparedStatement checkStmt = con.prepareStatement("SELECT score FROM result WHERE username = ?");
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                alreadyPassed = true;
            } else {
                PreparedStatement insertStmt = con.prepareStatement("INSERT INTO result (username, score) VALUES (?, ?)");
                insertStmt.setString(1, username);
                insertStmt.setInt(2, score);
                insertStmt.executeUpdate();
                insertStmt.close();
            }

            rs.close();
            checkStmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("score", score);
        request.setAttribute("alreadyPassed", alreadyPassed);
        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }
}
