# Etapa 1: compilar el proyecto con Java 21
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests


# Etapa 2: ejecutar el proyecto con Tomcat y Java 21
FROM tomcat:jdk21-temurin

# Eliminar aplicaciones predeterminadas de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar nuestro WAR a Tomcat
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/portafolio.war

# Render proporciona el puerto mediante PORT
ENV PORT=10000

# Cambiar el puerto 8080 de Tomcat por el puerto de Render
RUN sed -i 's/port="8080"/port="${port.http}"/' /usr/local/tomcat/conf/server.xml

ENV CATALINA_OPTS="-Dport.http=${PORT}"

EXPOSE 10000

CMD ["catalina.sh", "run"]