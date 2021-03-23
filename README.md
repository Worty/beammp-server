# Dockerfile for BeamMP-Server
[Dockerhub](https://hub.docker.com/r/05de56cac0ad79/beammp-server)

On first start Server.cfg will be generated in /app

Run example:
```
docker run --rm --network=host -v $(pwd)/cfg:/app 05de56cac0ad79/beammp-server
```

docker-compose.yml example:
```
version: '3.1'
services:
  beammp:
    image: 05de56cac0ad79/beammp-server
    container_name: beammp
    restart: unless-stopped
    volumes:
      - ./cfg:/app/
    network_mode: "host"
```
