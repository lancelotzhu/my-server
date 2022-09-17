#base image
FROM ubuntu:22.04
MAINTAINER lancelot_zhu@163.com

#set environmental variables 

#use local apt sources
COPY sources.list /etc/apt/sources.list

#install server software baseline
RUN apt update \
    && apt -y upgrade \
    && apt -y install tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && useradd -r -m -s /bin/bash admin \
    && echo "admin:myserver123" | chpasswd \
    && apt -y install sudo \
    && echo "%admin ALL=(ALL) ALL" > /etc/sudoers.d/admin \
    && apt -y install nano \
    && apt -y install openjdk-8-jdk-headless \
    && apt -y install supervisor \
    && apt-get clean

#configure supervisor
ADD supervisord.conf /etc/supervisor/supervisord.conf

#expose port
EXPOSE 9001

#startup supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
