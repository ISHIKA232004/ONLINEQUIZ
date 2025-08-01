Online Quiz Application
This is a Java-based web application that allows users to register, login, and take quizzes. It calculates scores and prevents reattempts if a user has already scored above a certain threshold.

Tech Stack
- Java (JSP & Servlet)
- MySQL (External: freesqldatabase.com)
- JDBC
- Apache Tomcat
- Deployed using Docker and Render

Features
- User Registration and Login
- Start Quiz, Submit Quiz, View Result
- Prevent quiz reattempt if score > 5
- Score stored in MySQL Database
- WAR file deployable via Docker
Docker Usage
You can build and run this app using Docker:
```bash
docker build -t online-quiz-app .
docker run -p 8080:8080 online-quiz-app
```
Then visit: http://localhost:8080

MySQL Connection Info
Connected to: sql7.freesqldatabase.com
Database Name: sql7793099
Username: sql7793099
Password: 9YLUCexPD8

Developed By
*Ishika Modi*
ishikamodi232004@gmail.com  
🔗 [GitHub](https://github.com/ISHIKA232004) | [LinkedIn](https://www.linkedin.com/in/ishika-modi-030867273/)
