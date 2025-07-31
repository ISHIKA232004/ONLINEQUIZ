<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Quiz App</title>
    <style>
        body {
            background: linear-gradient(to right, #6dd5fa, #2980b9);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            width: 300px;
        }

        .login-box input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
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
