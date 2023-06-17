#Pull base imdage
From tomcat:latest

EXPOSE 8080

RUN rm -rf /usr/local/tomcat/webapps/*

#copy war file on to container
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps/ROOT.war
