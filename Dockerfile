FROM maven
RUN git clone https://github.com/DevOpsByMK/webapplication.git
RUN mvn clean package

FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY --from=0 ./webapp/target/webapp.war /usr/local/tomcat/webapps/webapp.war
