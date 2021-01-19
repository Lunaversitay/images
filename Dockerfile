FROM ubuntu:18.04

LABEL author="Lunaversity" maintainer="lunaversitay@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /usr/share/man/man1

RUN apt-get update -y \
    && apt-get install -y software-properties-common \
    && apt-get update -y \
    && add-apt-repository -y ppa:openjdk-r/ppa \
    && apt-get update -y \
    && apt-get install -y -f curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 openjdk-11-jre openjdk-8-jre \
    && echo '/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java $@' > /usr/local/bin/java8 \
    && echo '/usr/lib/jvm/java-11-openjdk-amd64/bin/java $@' > /usr/local/bin/java11 \
    && chmod +x /usr/local/bin/java* \
    && useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

cmd ["/bin/bash", "/entrypoint.sh"]
