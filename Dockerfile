FROM ubuntu:22.04
LABEL org.opencontainers.image.source="https://github.com/SkyhighSecurity/cloudconnector-docker"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install -y wget unzip expect cron lsof
RUN mkdir /app
RUN wget -O Skyhigh_Cloud_Connector_UNIX64_6_3_2_2.sh.zip https://success.myshn.net/@api/deki/files/49214/Skyhigh_Cloud_Connector_UNIX64_6_3_2_2.sh.zip?revision=2
RUN unzip Skyhigh_Cloud_Connector_UNIX64_6_3_2_2.sh.zip
COPY entrypoint.sh /
COPY install.exp /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/usr/bin/bash", "/entrypoint.sh" ]