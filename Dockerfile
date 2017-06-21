FROM debian:stable
MAINTAINER Martin Peters

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget

# add Mosquitto repository key
RUN wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
RUN apt-key add mosquitto-repo.gpg.key

# add repository to sources.list.d
RUN wget -O /etc/apt/sources.list.d/mosquitto-jessie.list http://repo.mosquitto.org/debian/mosquitto-jessie.list
RUN apt-get update -y

# finally install 
RUN apt-get install -y mosquitto

# add a user
RUN adduser --system --disabled-password --disabled-login mosquitto
RUN mkdir /config && chown mosquitto -R /config
USER mosquitto

# expose a volumne for config and certs
VOLUME /config

# expose ports (normal unencrypted, TLS encrypted, WS encrypted)
EXPOSE 1883 8883 8080

# start mosquitto as main process
CMD ["mosquitto", "-c", "/config/mosquitto.conf"]
