FROM FROM adoptopenjdk/openjdk11:jre-11.0.12_7
EXPOSE 8085
COPY target/springbootApp.jar springbootApp.jar
CMD ["java", "-jar", "springbootApp.jar"]
