FROM openjdk:21-jdk-slim

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy Files
WORKDIR /usr/src/app
COPY . .

# Maven build (using installed Maven)
RUN mvn -Dmaven.test.skip=true package

# Docker Run Command
EXPOSE 8080
CMD ["java","-jar","/usr/src/app/target/playground-0.0.1-SNAPSHOT.jar"]
