FROM tomcat:8.0-alpine
LABEL maintainer="nagalekha2009@gmail.com"
ADD inframind.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]