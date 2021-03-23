from debian:buster-slim
ARG beammp=v1.20-linux

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install wget liblua5.3 rapidjson-dev libcurl4-openssl-dev ca-certificates --no-install-recommends && apt-get -y clean

WORKDIR /BeamMP-Server
RUN wget https://github.com/BeamMP/BeamMP-Server/releases/download/$beammp/BeamMP-Server-debian -O BeamMP-Server && chmod +x BeamMP-Server

WORKDIR /app
CMD /BeamMP-Server/BeamMP-Server
EXPOSE 30814

