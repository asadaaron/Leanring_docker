FROM openjdk:11
MAINTAINER asad
EXPOSE 8080
ADD target/aws-githubactions-docker.jar aws-githubactions-docker.jar
ENTRYPOINT ["java","-jar","/aws-githubactions-docker.jar"]