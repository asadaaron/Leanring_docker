FROM openjdk:11
MAINTAINER asad
ARG JAR_FILE=target/*.jar
COPY ./target/aws-githubactions-docker.jar aws-githubactions-docker.jar
ENTRYPOINT ["java","-jar","/aws-githubactions-docker.jar"]