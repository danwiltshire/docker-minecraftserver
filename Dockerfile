FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
ARG PAPERMC_VERSION
ENV JVM_MEM=1G

LABEL MAINTAINER="Daniel Wiltshire"
RUN apt-get update && apt-get install --no-install-recommends --yes \
    openjdk-11-jre-headless \
    && rm -rf /var/lib/apt/lists/*
RUN useradd -m -u 1000 -s /bin/bash paper \
    && mkdir /mnt/data /opt/papermc \
    && chmod 770 /mnt/data && chown -R paper:root /mnt/data \
    && chmod 770 /opt/papermc && chown -R paper:root /opt/papermc
ADD --chown=paper https://papermc.io/api/v1/paper/${PAPERMC_VERSION}/latest/download /opt/papermc/paperclip.jar
USER paper
VOLUME /mnt/data
WORKDIR /mnt/data
EXPOSE 25565
ENTRYPOINT java -jar -Xms${JVM_MEM} -Xmx${JVM_MEM} -Dcom.mojang.eula.agree=true /opt/papermc/paperclip.jar nogui