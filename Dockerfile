FROM gradle:4.7.0-jdk8-alpine AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM openjdk:8-jre-slim

COPY --from=build /home/gradle/src/build/libs/*.jar ./keycloak-metrics-spi.jar
RUN touch ./keycloak-metrics-spi.jar.dodeploy
