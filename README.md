Mosquitto MQTT Dockerfile
=========================

This Dockerfile builds the Mosquitto MQTT broker based on Debian Jessie. This image uses the Mosquitto version from the official Debian repository

Configuration
-------------

All configuration and SSL/TLS certificates shall be stored in the `/config` volume.
Mosquitto is started looking for a config file in `/config/mosquitto.conf` and exposes following ports:

  * `1883` for unencrypted MQTT
  * `8883` for TLS encrypted MQTT
  * `8080` for MQTT via Websocket. TLS encryption is recommended
