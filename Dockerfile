FROM ubuntu:18.04

# Resolve warnings in console when using apt
ARG DEBIAN_FRONTEND=noninteractive

MAINTAINER Daniel Wiltshire

# Download the Paper .JAR
ADD https://papermc.io/api/v1/paper/1.15.1/latest/download /opt/minecraft/paperclip.jar

# Install the JVM
RUN apt-get update && apt-get install --no-install-recommends --yes openjdk-11-jre-headless

# Prevent any other apt operations (e.g. upgrades)
RUN rm -rf /var/lib/apt/lists/*

# Add user with default values
RUN adduser -D minecraft

# Set ownership of persistent volume
RUN chmod -R 755 /mnt/data && chown -R minecraft /mnt/data

# Set execution user
USER minecraft

# Minecraft data (worlds, plugins, etc) in here
WORKDIR /mnt/data

# Expose the default Minecraft game port
EXPOSE 25565/tcp

ENTRYPOINT java -jar -Xms2G -Xmx2G -Dcom.mojang.eula.agree=true /opt/minecraft/paperclip.jar nogui --noconsole
