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
docker build -f Dockerfile.java8 -t lancelotzhu/java8:v1.0.0 .
```

#### run a container
```sh
docker run -d -it --name my-server -p 9001:9001 lancelotzhu/openjre8:v1.0.0
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
- nano
- curl
- ping
- ifconfig
- openjre8-headless
- python3
- supervisor

#### create a base image
```sh
docker build -f Dockerfile.java8.slim -t lancelotzhu/java8-slim:v1.0.0 .
```

#### run a container
```sh
docker run -d -it --name my-server -p 9001:9001 lancelotzhu/openjre8:v1.0.0
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