<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Quiz App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            background: linear-gradient(to right, #6dd5fa, #2980b9);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0 10px;
        }

        .login-box {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            width: 100%;
            max-width: 350px;
            box-sizing: border-box;
        }

        .login-box input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        .login-box input[type="submit"] {
            background-color: #2980b9;
            color: white;
            border: none;
            cursor: pointer;
        }

        .login-box input[type="submit"]:hover {
            background-color: #216796;
        }

        .msg {
            margin-top: 10px;
            font-size: 14px;
        }

        .msg.error {
            color: red;
        }

        .msg.success {
            color: green;
        }

        a {
            color: #2980b9;
            text-decoration: none;
            font-size: 14px;
        }

        @media (max-width: 400px) {
            .login-box {
                padding: 30px 20px;
            }

            .login-box h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>

    <div class="msg <%= request.getParameter("error") != null ? "error" : "success" %>">
        <%= request.getParameter("error") != null ? request.getParameter("error") : request.getParameter("msg") != null ? request.getParameter("msg") : "" %>
    </div>

    <p><a href="register.jsp">New user? Register here</a></p>
</div>

</body>
</html>
