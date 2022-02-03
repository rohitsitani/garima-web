FROM tomcat:8.0-alpine

LABEL maintainer="rohit"

ADD WebContent/*.* /usr/local/tomcat/webapps/web/

EXPOSE 8080

CMD ["catalina.sh", "run"]
