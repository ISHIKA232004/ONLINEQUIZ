<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Result</title>
    <style>
        body {
            background-color: #000000;
            font-family: Arial, sans-serif;
            text-align: center;
            color: white;
            margin: 0;
            height: 100vh;
            box-sizing: border-box;
            padding: 40px 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        p {
            font-size: 20px;
            font-weight: bold;
            margin: 10px 0;
        }
        .close-button {
            background-color: red;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin-top: 30px;
            cursor: pointer;
            width: 80%;
            max-width: 200px;
        }
    </style>
</head>
<body>

<h2>Your Quiz Result</h2>

<%
    Integer score = (Integer) request.getAttribute("score");
    if (score != null) {
%>
    <p>Your Score is: <%= score %> / 10</p>
    <% if(score >= 5) { %>
        <p>🎉 Congratulations! You passed the quiz.</p>
    <% } else { %>
        <p>❌ You did not pass. Better luck next time!</p>
    <% } %>
<%
    } else {
%>
    <p>Error: Score not found. Please try again.</p>
<%
    }
%>

<form action="index.jsp" method="get">
    <input type="submit" value="Close" class="close-button">
</form>

<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>
<script>
var end = Date.now() + (15 * 1000);
var colors = ['#FF0000', '#FF7F00', '#FFFF00', '#006400', '#0000FF', '#4B0082', '#8F00FF'];

(function frame() {
  confetti({
    particleCount: 7,
    angle: 60,
    spread: 55,
    origin: { x: 0 },
    colors: colors
  });
  confetti({
    particleCount: 7,
    angle: 120,
    spread: 55,
    origin: { x: 1 },
    colors: colors
  });

  if (Date.now() < end) {
    requestAnimationFrame(frame);
  }
})();
</script>

</body>
</html>
