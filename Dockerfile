FROM tomcat:8.0-alpine

LABEL maintainer="rohit"

ADD tomcat-users.xml /usr/local/tomcat/conf/

ADD WebContent/*.* /usr/local/tomcat/webapps/web-example/

ADD python/*.* .

EXPOSE 8080

CMD ["catalina.sh", "run"]
