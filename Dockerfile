### statge 1

FROM maven:3.8.6-openjdk-11-slim as builder

WORKDIR /app

ADD . /app

RUN mvn install package


### stage 2

FROM tomcat:8-jre8

COPY --from=builder /app/webapp/target/webapp.war /usr/local/tomcat/webapps/
