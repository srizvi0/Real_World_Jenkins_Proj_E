FROM lolhens/baseimage-openjre
EXPOSE 8085
COPY target/springbootApp.jar springbootApp.jar
CMD ["java", "-jar", "springbootApp.jar.jar"]
