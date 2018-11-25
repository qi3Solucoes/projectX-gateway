FROM openjdk:8

MAINTAINER Qi Soluções inteligentes

RUN apt-get update

RUN apt-get install netcat-openbsd

#The project JAR file is added to the container as app.jar and then #executed in the ENTRYPOINT
ADD /target/gateway-0.0.1.jar app.jar

COPY api-gateway.sh /opt/bin/api-gateway.sh

RUN chmod 755 /opt/bin/api-gateway.sh

#RUN command to “touch” the jar file so that it has a file #modification time
RUN bash -c 'touch /app.jar'

# To reduce Tomcat startup time we added a system property pointing # to “/dev/urandom” as a source of entropy.
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

#on which port our application is listing
EXPOSE 8080