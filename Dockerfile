# syntax=docker/dockerfile:1
FROM maven AS build
WORKDIR /app
COPY . .


FROM tomcat
COPY --from=build /app/target/JSPSample-0.0.1.war /usr/local/tomcat/webapps


EXPOSE 8080