FROM eclipse-temurin:21
RUN mkdir /opt/app
EXPOSE 8080
COPY target/springbootApp.jar /opt/app.jar
CMD ["java", "-jar", "/opt/app.jar"]
