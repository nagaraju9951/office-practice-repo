FROM tomcat:latest

COPY HelloWorld.war /usr/local/tomcat/webapps/ROOT.war

RUN rm -rf /usr/local/tomcat/webapps/ROOT

EXPOSE 8001

CMD ["catalina.sh", "run"]
