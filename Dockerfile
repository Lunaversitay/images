FROM openjdk:8-jre-slim

LABEL author="Lunaversity" maintainer="lunaversitay@gmail.com"

RUN apt-get update -y \
    && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 wget openjdk-11-jdk \
    && apt-get update -y \
    && useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

cmd ["/bin/bash", "/entrypoint.sh"]
