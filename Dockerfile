#base image
FROM ubuntu:22.04
LABEL mail=lancelot_zhu@163.com

#set environmental variables 
ENV LANG="zh_CN.utf8"

#use local apt sources
COPY sources.list /etc/apt/sources.list

#install server software baseline
RUN apt update \
    && apt -y upgrade \
    && apt -y install \
    && apt -y install tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apt install -y language-pack-zh-hans \
    && useradd -r -m -s /bin/bash admin \
    && apt -y install sudo \
    && echo "%admin ALL=(ALL) ALL" > /etc/sudoers.d/admin \
    && apt -y install nano \
    && apt -y install openjdk-8-jdk-headless \
    && apt -y install supervisor \
    && apt-get clean

