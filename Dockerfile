FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install -y wget unzip expect
RUN mkdir /app
RUN wget -O Skyhigh_Cloud_Connector_UNIX64_6_3_2_2.sh.zip https://success.myshn.net/@api/deki/files/49214/Skyhigh_Cloud_Connector_UNIX64_6_3_2_2.sh.zip?revision=2
RUN unzip Skyhigh_Cloud_Connector_UNIX64_6_3_2_2.sh.zip
COPY entrypoint.sh /
COPY install.expect /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "bash /entrypoint.sh" ]