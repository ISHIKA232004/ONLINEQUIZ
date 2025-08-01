package mypack;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("QuizServlet called"); 
        ArrayList<Question> questions = new ArrayList<>();

        try {
        	System.out.println("Loading DB driver...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver loaded.");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");
//            Connection con = DriverManager.getConnection(
//            	    "jdbc:mysql://containers-us-west-123.railway.app:6543/student",
//            	    "root",
//            	    "password"
//            	);

            System.out.println("DB connected.");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM question");

            while(rs.next()) {
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

            System.out.println("Questions fetched: " + questions.size()); 
            con.close();
        } 
        catch(Exception e) {
            System.out.println("DB Error: " + e);
            e.printStackTrace();
        }

        request.setAttribute("questions", questions);
        request.getSession().setAttribute("questions", questions);
        RequestDispatcher rd = request.getRequestDispatcher("quiz.jsp");
        rd.forward(request, response);
    }
}
