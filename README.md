# Dockerfile for BeamMP-Server
[Github pkgs](https://github.com/Worty/beammp-server-docker/pkgs/container/beammp-server)

On first start Server.cfg will be generated in /app

Run example:
```
docker run --rm --network=host -v $(pwd)/cfg:/app ghcr.io/worty/beammp-server:latest
```

docker-compose.yml example:
```
version: '3.1'
services:
  beammp:
    image: ghcr.io/worty/beammp-server:latest
    container_name: beammp
    restart: unless-stopped
    environment:
      - TZ=Europe/Berlin
    volumes:
      - ./cfg:/app/
    network_mode: "host"
```
