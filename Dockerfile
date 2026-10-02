# Stage 1: Build Java application
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn clean package -DskipTests


# Stage 2: Run Java application
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/target/java-docker-learning-1.0.jar app.jar

CMD ["java", "-jar", "app.jar"]
