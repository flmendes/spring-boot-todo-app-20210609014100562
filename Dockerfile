FROM maven:3.6-jdk-12-alpine as build

WORKDIR /app

COPY pom.xml .

COPY src src

RUN mvn package

FROM openjdk:12-alpine

COPY --from=build /app/target/spring-boot-todo-app-1.1.0-SNAPSHOT.jar \
                  /app/target/spring-boot-todo-app.jar

ENTRYPOINT ["java", "-jar"]
CMD ["/app/target/spring-boot-todo-app.jar"]