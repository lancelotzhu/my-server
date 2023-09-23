# my-server

### openjdk8-hotspot-slim

This base image contains the following software:
- debian bullseye
- curl
- ps
- openjre8

#### create a base image
```sh
docker build -f docker/Dockerfile.openjdk8-hotspot.slim  -t lancelotzhu/openjdk8-hotspot:1.0.0-slim --build-arg APP_PORT=8000 --build-arg LOG_DIR=/home/admin/logs .
docker buildx build -f docker/Dockerfile.openjdk8-hotspot.slim -t lancelotzhu/openjdk8-hotspot:1.0.0-slim --platform=linux/arm64/v8,linux/amd64 --build-arg APP_PORT=8000 --build-arg LOG_DIR=/home/admin/logs . --push
```

#### run a container
```sh
mvn clean install -Dmaven.test.skip=true
docker compose up -d
```

#### operate the newly created container
**Login as admin and manage the applications (recommended)**
```sh
docker exec -it -u admin -w /home/admin my-server /bin/bash
```
