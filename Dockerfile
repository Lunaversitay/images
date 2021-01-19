FROM debian:stable-slim

LABEL author="Lunaversity" maintainer="lunaversitay@gmail.com"

RUN mkdir -p /usr/share/man/man1

RUN apt-get update -y \
    && apt-get install -y software-properties-common \
    && apt-get update -y \
    && apt-get install -y -f curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 openjdk-11-jre openjdk-8-jre \
    && apt-get update -y \
    && echo "alias java11='/usr/lib/jvm/java-11-openjdk-amd64/bin/java'" >>  ~/.bashrc
    && echo "alias java8='/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java'" >> ~/.bashrc
    && useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

cmd ["/bin/bash", "/entrypoint.sh"]
