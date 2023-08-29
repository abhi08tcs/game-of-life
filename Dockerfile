FROM tomcat:9-jdk8
LABEL author="demo1"
LABEL description="this is gol project"
LABEL organization="lt"
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080