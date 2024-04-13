FROM cgdevops/openjdk17-jdk
EXPOSE 8085
COPY target/springbootApp.jar springbootApp.jar
CMD ["java", "-jar", "springbootApp.jar"]
