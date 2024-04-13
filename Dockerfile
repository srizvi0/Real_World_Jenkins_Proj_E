FROM adoptopenjdk/openjdk11
EXPOSE 8085
COPY target/springbootApp.jar springbootApp.jar
CMD ["java", "-jar", "springbootApp.jar"]
