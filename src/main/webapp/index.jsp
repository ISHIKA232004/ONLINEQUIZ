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
            background-image: url('docs/Welcome.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            height: 100vh;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px;
        }

        .content {
            background: rgba(255, 255, 255, 0.85);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            font-size: 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        @media (max-width: 500px) {
            input[type="submit"] {
                font-size: 16px;
                padding: 10px 20px;
            }

            .content {
                padding: 20px;
            }
        }
    </style>
</head>

<body>
    <div class="content">
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
