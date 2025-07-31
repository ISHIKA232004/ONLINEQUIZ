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
    <style>
        body {
            background-image: url('docs/Welcome.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center 20%;
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            height: 100vh;
            overflow: hidden;
            position: relative;
        }

        .content {
            position: absolute;
            top: 60%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 100px;
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
