FROM tomcat:9.0-jdk11
LABEL maintainer="vishnuraj@oracle.com"
EXPOSE 8080

# Delete default Tomcat apps so yours loads on /
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy as ROOT.war = root URL
COPY target/myproject.war /usr/local/tomcat/webapps/ROOT.war
