FROM gradle:jdk8-alpine AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM eclipse-temurin:8-jre-alpine

COPY --from=build /home/gradle/src/build/libs/*.jar ./keycloak-metrics-spi.jar
RUN touch ./keycloak-metrics-spi.jar.dodeploy
