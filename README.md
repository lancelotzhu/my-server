# my-server

### java8

This base image contains the following software:
- ubuntu 22.04 LTS
- nano
- curl
- ping
- ifconfig
- openjdk8-headless
- python3
- supervisor

#### create a base image
```sh
docker build -f Dockerfile.java8 -t lancelotzhu/java8:1.0.0 .
docker buildx build -f Dockerfile.java8 -t lancelotzhu/java8:1.0.0 --platform=linux/arm64/v8,linux/amd64 . --push
```

#### run a container
```sh
chdocker run -d -it --name my-server -p 9001:9001 lancelotzhu/java8:1.0.0
```

#### operate the newly created container
**Login as root and manage the system**
```sh
docker exec -it my-server /bin/bash
```
**Login as admin and manage the applications (recommended)**
```sh
docker exec -it -u admin -w /home/admin my-server /bin/bash
```

### java8-slim

This base image contains the following software:
- debian bullseye
- curl
- ps
- openjre8

#### create a base image
```sh
docker build -f docker/Dockerfile.java8.slim  -t lancelotzhu/java8:1.0.2-slim --build-arg APP_PORT=8888 --build-arg LOG_DIR=/home/admin/logs/sample-app .
docker buildx build -f docker/Dockerfile.java8.slim -t lancelotzhu/java8:1.0.2-slim --platform=linux/arm64/v8,linux/amd64 . --push
```

#### run a container
```sh
mvn clean install -Dmaven.test.skip=true
docker run -itd --name my-server -e APP_NAME=sample-app -e APP_OPTS="--spring.profiles.active=dev" -p 8888:8888 -v target:/home/admin/app lancelotzhu/java8:1.0.2-slim
```

#### operate the newly created container
**Login as root and manage the system**
```sh
docker exec -it my-server /bin/bash
```
**Login as admin and manage the applications (recommended)**
```sh
docker exec -it -u admin -w /home/admin my-server /bin/bash
```

### java17-slim

This base image contains the following software:
- ubuntu 22.04 LTS
- nano
- curl
- ping
- ifconfig
- openjdk-17-jdk-headless
- python3
- supervisor

#### create a base image
```sh
docker build -f Dockerfile.java17.slim -t lancelotzhu/java17:1.0.1-slim .
docker buildx build -f Dockerfile.java17.slim -t lancelotzhu/java17:1.0.1-slim --platform=linux/arm/v7,linux/arm64,linux/amd64 . --push
```

#### run a container
```sh
docker run -d -it --name my-server -p 9001:9001 lancelotzhu/java17:1.0.1-slim
```

#### operate the newly created container
**Login as root and manage the system**
```sh
docker exec -it my-server /bin/bash
```
**Login as admin and manage the applications (recommended)**
```sh
docker exec -it -u admin -w /home/admin my-server /bin/bash
```