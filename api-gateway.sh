#!/bin/sh
while ! nc -z config-server 8888 ; do
    echo "Waiting for the Config Server"
    sleep 3
done
while ! nc -z service-discovery 8761 ; do
    echo "Waiting for the service discovery"
    sleep 3
done
java -jar /app.jar