FROM debian:jessie
MAINTAINER Martin Peters

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mosquitto

# add a user
RUN adduser --system --disabled-password --disabled-login mosquitto
RUN mkdir /config && chown mosquitto -R /config
USER mosquitto

# expose a volumne for config and certs
VOLUME /config

# expose ports (normal unencrypted, TLS encrypted, WS encrypted)
EXPOSE 1883 8883 8080

# start mosquitto in foreground
ENTRYPOINT ["mosquitto", "-c", "/config/mosquitto.conf"]
