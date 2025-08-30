<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Programming Language</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
            background: #f5f5f5;
        }
        .container {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            width: 400px;
            margin: auto;
        }
        select, button {
            padding: 10px;
            font-size: 16px;
            margin-top: 20px;
            width: 100%;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        button {
            background: #4CAF50;
            color: white;
            cursor: pointer;
            border: none;
        }
        button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Select Your Favourite Programming Language</h2>
        <form action="QuizServlet" method="get">
            <select name="language" required>
                <option value="">-- Select Language --</option>
                <option value="Java">Java</option>
                <option value="Python">Python</option>
                <option value="C/C++">C/C++</option>
                <option value="HTML & CSS">HTML & CSS</option>
            </select>
            <button type="submit">Start Quiz</button>
        </form>
    </div>
</body>
</html>
