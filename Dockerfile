FROM openjdk:8-jre-alpine

RUN apk add --update curl && rm -rf /var/cache/apk/*

ARG WIREMOCK_VERSION
ENV WIREMOCK_VERSION $WIREMOCK_VERSION

RUN mkdir -p /opt/wiremock \
  && curl https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/${WIREMOCK_VERSION}/wiremock-standalone-$WIREMOCK_VERSION.jar -o /opt/wiremock/wiremock-standalone.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/wiremock/wiremock-standalone.jar"]
