#
# MAINTAINER        Carson,C.J.Zeong <zcy@nicescale.com>
# DOCKER-VERSION    1.10.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       centos:latest
MAINTAINER pp

ENV TZ "Asia/Shanghai"
ENV TERM linux
ENV LANG "en_US.UTF-8"

ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo

RUN yum install -y curl wget tar bzip2 unzip vim sudo yum-utils net-tools man openssh-server && \
    yum install -y gcc gcc-c++ git make automake cmake python-devel python-pip net-tools && \
    yum clean all

RUN  ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' && \
     ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
     ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N '' && \
     sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
     sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config 

RUN pip install --upgrade pip
RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf
ADD supervisor_ssh.conf /etc/supervisor.conf.d/ssh.conf
RUN mkdir -p /etc/supervisor.conf.d && \
    mkdir -p /var/log/supervisor

EXPOSE 22

