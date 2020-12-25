FROM alpine:3.12

# OCI Meta information
LABEL org.opencontainers.image.authors="Joakim Lindbom <Joakim.Lindbom@gmail.com>"
LABEL org.opencontainers.image.created=${BUILD_DATE}
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.url="https://github.com/JoakimLindbom/hamqtt1"
LABEL org.opencontainers.image.licenses="BSD"
LABEL org.opencontainers.image.title="MQTT Client test 1"
LABEL org.opencontainers.image.description="Freestanding Mosquitto client to Home Assistant

VOLUME /opt/certs

RUN apk update && \
    apk upgrade
RUN apk add --no-cache mosquitto-clients ca-certificates && \
    /etc/ca-certificates/update.d/certhash && \
    ln -s /usr/bin/mosquitto_pub /usr/local/bin/pub && \
    ln -s /usr/bin/mosquitto_sub /usr/local/bin/sub
RUN pip install paho-mqtt

USER nobody
