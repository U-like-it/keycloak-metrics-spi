FROM eclipse-temurin:8-jre-alpine

COPY build/libs/*.jar ./keycloak-metrics-spi.jar
RUN touch ./keycloak-metrics-spi.jar.dodeploy
