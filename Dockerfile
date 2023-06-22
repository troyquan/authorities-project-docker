
FROM openjdk:17

# copy jar file into container
COPY service-system.jar .

# intit command
CMD ["java", "-jar", "service-system.jar"]
