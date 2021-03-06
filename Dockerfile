FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
ADD ${JAR_FILE} app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT ["java","$JAVA_OPTS", "-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]