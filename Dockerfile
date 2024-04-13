FROM lolhens/baseimage-openjre
RUN mkdir /opt/app
EXPOSE 8085
COPY target/springbootApp.jar /opt/app.jar
CMD ["java", "-jar", "/opt/app.jar"]
