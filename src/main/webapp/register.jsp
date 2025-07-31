<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            background-image: linear-gradient(to right, #6a11cb, #2575fc);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .register-box {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            width: 350px;
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            background-color: #2575fc;
            color: white;
            padding: 12px 20px;
            margin-top: 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #1a5edb;
        }

        .message {
            color: red;
            margin-top: 10px;
        }

        .login-link {
            margin-top: 15px;
            display: block;
            font-size: 14px;
            color: #333;
        }

        .login-link a {
            color: #2575fc;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function validateForm() {
            const email = document.forms["regForm"]["email"].value;
            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!regex.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="register-box">
        <h2>Register</h2>
        <form name="regForm" action="RegisterServlet" method="post" onsubmit="return validateForm();">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="email" name="email" placeholder="Email" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Register">
        </form>

        <% if (request.getParameter("msg") != null) { %>
            <div class="message"><%= request.getParameter("msg") %></div>
        <% } %>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>
</body>
</html>
