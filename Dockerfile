# syntax=docker/dockerfile:1
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat
COPY --from=build /app/target/JSPSample-0.0.1.war /usr/local/tomcat/webapps

# Exponha a porta 8080 do contêiner
EXPOSE 8080