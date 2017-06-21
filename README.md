Mosquitto MQTT Dockerfile
=========================

This Dockerfile builds the Mosquitto MQTT broker based on Debian stable. This image uses the Mosquitto version from the official Mosquitto Debian repository.
The Mosquitto MQTT broker runs under the user `mosquitto`

Configuration
-------------

All configuration and SSL/TLS certificates shall be stored in the `/config` volume.
Mosquitto is started looking for a config file in `/config/mosquitto.conf` and exposes following ports:

  * `1883` for unencrypted MQTT
  * `8883` for TLS encrypted MQTT
  * `8080` for MQTT via Websocket. TLS encryption is recommended

Run this image
--------------

`docker run -p 1883:1883 -p 8883:8883 -p 8080:8080 freakybytes/mosquitto`

Adjust port mapping according to your environment.
