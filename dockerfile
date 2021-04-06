from debian:buster-slim
ARG beammp=v2.0.3

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install liblua5.3 libssl-dev --no-install-recommends && apt-get -y clean

WORKDIR /BeamMP-Server
ADD https://github.com/BeamMP/BeamMP-Server/releases/download/$beammp/BeamMP-Server-linux ./BeamMP-Server 
RUN chmod +x BeamMP-Server

WORKDIR /app
CMD /BeamMP-Server/BeamMP-Server
EXPOSE 30814

