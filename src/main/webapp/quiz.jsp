<%@ page import="java.util.*, mypack.Question" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Page</title>
    <style>
        body {
            background-image: url('bg.jpg');   
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: white;
            font-family: Arial, sans-serif;
        }
        h2 {
            text-align: center;
        }
        form {
            background-color: rgba(75, 0, 130, 0.6);
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            margin: auto;
        }
        input[type="submit"] {
            background-color: green;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
        }

        /* 👇 Updated question and option styling */
        .question {
            font-size: 18px;
            font-weight: normal;
            color: white;
            margin-bottom: 10px;
        }
        .option {
            margin-left: 20px;
            font-size: 16px;
        }

        .scroll-text {
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            box-sizing: border-box;
            animation: scroll-left 15s linear infinite;
            font-size: 20px;
            color: black;
            font-weight: bold;
        }
        @keyframes scroll-left {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
        }

        /* ✅ Timer styling */
        #timer {
            font-size: 18px;
            font-weight: bold;
            color: black;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>
    <div class="scroll-text">Welcome to Online Quiz!</div>

    <h2>Online Quiz</h2>

    <!-- Timer Display -->
    <div id="timer">
        Time Left: <span id="time">01:00</span>
    </div>

    <!-- 🛠 Timer JavaScript FIXED -->
    <script>
        var totalSeconds = 60; 

        function startTimer() {
            var timer = setInterval(function () {
                var minutes = Math.floor(totalSeconds / 60);
                var seconds = totalSeconds % 60;

                document.getElementById('time').innerHTML =
                    (minutes < 10 ? "0" : "") + minutes + ":" +
                    (seconds < 10 ? "0" : "") + seconds;

                if (totalSeconds <= 0) {
                    clearInterval(timer);
                    alert("Time's up! Your quiz will be submitted automatically.");
                    document.getElementById("quizForm").submit();
                }

                totalSeconds -= 1;
            }, 1000);
        }

        window.onload = startTimer;
    </script>

    <!-- Quiz Form Start -->
    <form id="quizForm" action="SubmitQuizServlet" method="post" onsubmit="return validateQuiz();">
        <%
            ArrayList<Question> questions = (ArrayList<Question>)request.getAttribute("questions");
            if(questions != null) {
                int i = 1;
                for(Question q : questions) {
        %>
            <!-- ✅ Question text -->
            <p class="question"><%= i + ". " + q.getQuestion() %></p>

            <!-- ✅ Options with spacing -->
            <div class="option">
                <input type="radio" name="q<%=q.getId()%>" value="<%=q.getOption1()%>"> <%=q.getOption1()%><br>
                <input type="radio" name="q<%=q.getId()%>" value="<%=q.getOption2()%>"> <%=q.getOption2()%><br>
                <input type="radio" name="q<%=q.getId()%>" value="<%=q.getOption3()%>"> <%=q.getOption3()%><br>
                <input type="radio" name="q<%=q.getId()%>" value="<%=q.getOption4()%>"> <%=q.getOption4()%><br><br>
            </div>
        <%
                    i++;
                }
            } else {
        %>
            <p>No questions available.</p>
        <%
            }
        %>
        
        <input type="submit" value="Submit Quiz">
    </form>

    <!-- Form Validation (All questions answered check) -->
    <script>
        function validateQuiz() {
            var allQuestions = document.querySelectorAll("input[type=radio]");
            var questionNames = new Set();

            allQuestions.forEach(function(radio){
                questionNames.add(radio.name);
            });

            for (let name of questionNames) {
                var options = document.getElementsByName(name);
                var answered = false;
                for (var opt of options) {
                    if (opt.checked) {
                        answered = true;
                        break;
                    }
                }
                if (!answered) {
                    showModal();
                    return false;
                }
            }
            return true;
        }

        function showModal() {
            document.getElementById("myModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }
    </script>

    <!-- Modal for Unanswered Questions -->
    <div id="myModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background-color: rgba(0,0,0,0.7); text-align:center; padding-top:200px;">
        <div style="background:white; color:black; display:inline-block; padding:20px; border-radius:10px;">
            <p>Please answer all questions before submitting.</p>
            <button onclick="closeModal()">OK</button>
        </div>
    </div>

</body>
</html>
