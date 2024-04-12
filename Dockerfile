FROM eclipse-temurin:21
RUN mkdir /opt/app
COPY springbootApp.jar /opt/app
CMD ["java", "-jar", "/opt/app/springbootApp.jar"]