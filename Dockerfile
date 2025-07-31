# Use Tomcat 9 bundled with Temurin JDK 21
FROM tomcat:9.0-jdk21-temurin

COPY OnlineQuizApp.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
