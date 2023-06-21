
FROM openjdk:17-jdk-hotspot

# copy jar file into container
COPY service-system.jar .

# intit command
CMD ["java", "-jar", "service-system.jar"]
