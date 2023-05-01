FROM openjdk:18-alpine3.13
MAINTAINER asad
ARG JAR_FILE=target/*.jar
COPY ./target/docker-0.0.1-SNAPSHOT.jar error-handeler.jar
ENTRYPOINT ["java","-jar","/error-handeler.jar"]