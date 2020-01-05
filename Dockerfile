FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
LABEL MAINTAINER="Daniel Wiltshire"
ADD https://papermc.io/api/v1/paper/1.15.1/latest/download /opt/minecraft/paperclip.jar
RUN apt-get update && apt-get install --no-install-recommends --yes \
    openjdk-11-jre-headless \
    && rm -rf /var/lib/apt/lists/*
RUN useradd -m -u 1000 -s /bin/bash paper
USER paper
VOLUME /mnt/data
WORKDIR /mnt/data
EXPOSE 25565
ENTRYPOINT java -jar -Xms2G -Xmx2G -Dcom.mojang.eula.agree=true /opt/minecraft/paperclip.jar nogui
