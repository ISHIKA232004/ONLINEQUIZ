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
        String language = (String) session.getAttribute("language"); 
        @SuppressWarnings("unchecked")
        ArrayList<Question> questions = (ArrayList<Question>) session.getAttribute("questions");

        if(username == null || language == null) {
            response.sendRedirect("login.jsp"); // session expired or not set
            return;
        }

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

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password")) {

                try (PreparedStatement checkStmt = con.prepareStatement("SELECT score FROM result WHERE username = ? AND language = ?")) {
                    checkStmt.setString(1, username);
                    checkStmt.setString(2, language);
                    try (ResultSet rs = checkStmt.executeQuery()) {
                        if (rs.next()) {
                            int oldScore = rs.getInt("score");
                            if (score > oldScore) {
                                try (PreparedStatement updateStmt = con.prepareStatement("UPDATE result SET score=? WHERE username=? AND language=?")) {
                                    updateStmt.setInt(1, score);
                                    updateStmt.setString(2, username);
                                    updateStmt.setString(3, language);
                                    updateStmt.executeUpdate();
                                }
                            }
                        } else {
                            try (PreparedStatement insertStmt = con.prepareStatement("INSERT INTO result(username, score, language) VALUES (?, ?, ?)")) {
                                insertStmt.setString(1, username);
                                insertStmt.setInt(2, score);
                                insertStmt.setString(3, language);
                                insertStmt.executeUpdate();
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("score", score);
        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }
}
