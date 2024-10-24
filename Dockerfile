FROM ubuntu:22.04
LABEL org.opencontainers.image.source="https://github.com/SkyhighSecurity/cloudconnector-docker"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install -y wget unzip expect cron lsof
RUN mkdir /app
RUN wget -O Skyhigh_Cloud_Connector_UNIX64_6_7_2_0.sh.zip https://success.skyhighsecurity.com/@api/deki/files/64152/Skyhigh_Cloud_Connector_UNIX64_6_7_2_0.sh.zip?revision=1
RUN unzip Skyhigh_Cloud_Connector_UNIX64_6_7_2_0.sh.zip
COPY entrypoint.sh /
COPY install.exp /
RUN chmod +x /entrypoint.sh
EXPOSE 8443
ENTRYPOINT [ "/usr/bin/bash", "/entrypoint.sh" ]