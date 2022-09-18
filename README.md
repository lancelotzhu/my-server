# my-server

This base image contains the following softwares:
- ubuntu 22.04 LTS
- nano
- openjdk8-headless
- python3
- supervisor

#### create a base image
```sh
docker build -t my-server-base:v1.0.0 .
```

#### run a container
```sh
docker run -d -it --name my-server -p 9001:9001 my-server-base:v1.0.0
```

#### operate the newly created container
**Login as root and manage the system**
```sh
docker exec -it my-server /bin/bash
```
**Login as admin and manage the applications (recomended)**
```sh
docker exec -it -u admin -w /home/admin my-server /bin/bash
```