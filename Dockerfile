FROM tomcat:9.0-jdk11

# WAR file ko Tomcat webapps folder me copy karo
COPY OnlineQuizApp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
