FROM alpine:latest as build
RUN apk update && apk --no-cache upgrade
RUN apk add --no-cache lua5.3 libgcc
RUN apk add --no-cache git make cmake g++ lua5.3-dev zlib-dev rapidjson-dev openssl-dev boost-dev
ARG beammp=v2.2.0
ARG BUILD_TYPE=Release


RUN git clone --recursive https://github.com/BeamMP/BeamMP-Server && cd BeamMP-Server &&  git checkout tags/${beammp}
WORKDIR /BeamMP-Server
RUN cmake . -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_CXX_COMPILER=g++ -DLUA_LIBRARY=/usr/lib/lua5.3/liblua-5.3.so.0 && cmake --build . -j$(nproc) --config $BUILD_TYPE


FROM alpine:latest
RUN apk update && apk --no-cache upgrade
RUN apk add --no-cache lua5.3 libgcc
COPY --from=build /BeamMP-Server/BeamMP-Server /BeamMP-Server/BeamMP-Server
WORKDIR /app
CMD /BeamMP-Server/BeamMP-Server
EXPOSE 30814
