<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Quiz Application</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background-color: #2e1b3b;
            font-family: Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 20px;
        }

        .welcome-img {
            max-width: 90%;
            height: auto;
            margin-bottom: 20px;
        }

        .quiz-box form {
            display: flex;
            justify-content: center;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 8px 25px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        @media (max-width: 500px) {
            body {
                padding: 15px;
            }

            .welcome-img {
                max-width: 100%;
            }

            input[type="submit"] {
                font-size: 15px;
                padding: 8px 20px;
            }
        }
    </style>
</head>
<body>

    <img src="docs/Welcome.jpg" alt="Welcome to Quiz" class="welcome-img">

    <div class="quiz-box">
        <form action="QuizServlet" method="get">
            <input type="submit" value="Start Quiz">
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>
    <script>
        confetti({
            particleCount: 150,
            spread: 100,
            origin: { y: 0.6 }
        });
    </script>

</body>
</html>
