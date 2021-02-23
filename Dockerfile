FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y binutils curl ca-certificates libgcc1:i386 libstdc++6:i386 libtbb2:i386 libterm-ui-perl locales locales-all net-tools \
    && mkdir -p /root/Steam/Valheim \
    && cd /root/Steam/ \
    && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - \
    && ./steamcmd.sh +login anonymous +force_install_dir /root/Steam/Valheim/ +app_update 896660 validate +exit \
    && rm -rf /root/.steam/logs/* /var/lib/apt/lists/* /tmp/*

COPY start-server-custom.sh /root/Steam/Valheim/

EXPOSE 2456-2458/udp
WORKDIR /root/Steam/Valheim

ENTRYPOINT ["/bin/bash", "/root/Steam/Valheim/start-server-custom.sh"]