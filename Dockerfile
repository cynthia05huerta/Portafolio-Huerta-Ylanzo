FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY portafolio/ .
RUN mvn clean package -DskipTests

FROM tomcat:jdk21-temurin
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]