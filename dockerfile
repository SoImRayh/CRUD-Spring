FROM openjdk
ARG JAR_FILE=target/Spring-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app/app.jar
ENTRYPOINT ["java","-jar","app/app.jar"]