FROM maven:3.6.3-openjdk-17-slim as builder

COPY . /app
RUN ls -la /app
WORKDIR /app
RUN mvn clean install

# Debug the build:
RUN ls -la /app/target/

FROM openjdk:8-jdk-alpine
ARG TARGET=/app/target
COPY --from=builder ${TARGET}/RestaurantWeb-*.jar /app/target/RestaurantWeb.jar

# Debug the build:
RUN ls -la /app/target/

EXPOSE 9000
ENTRYPOINT [ "java","-jar","./app/target/RestaurantWeb.jar" ]
