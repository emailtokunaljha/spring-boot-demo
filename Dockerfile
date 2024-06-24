FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/spring-boot-demo-1.0.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
