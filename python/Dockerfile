#
# MAINTAINER        Carson,C.J.Zeong <zcy@nicescale.com>
# DOCKER-VERSION    1.10.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM   sinobyte/centos_base:7.2.1511.2
MAINTAINER pp

RUN yum install -y curl wget tar bzip2 unzip vim sudo yum-utils net-tools man sshd  && \
    yum install -y zlib-devel openssl-devel  readline-devel sqlite-devel bzip2-devel  && \
    yum install -y gcc gcc-c++ git make automake cmake python-devel && \
    yum install -y ncurses-devel cmake bison && \
    yum clean all

COPY Python-3.5.1.tar.xz /usr/local/src/
#RUN cd /usr/local/src/ && wget "https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tar.xz" && \
#    xz -d Python-3.5.1.tar.xz && cd Python-3.5.1 && tar xf Python-3.5.1.tar && ./configure --prefix=/usr/local/python3  && \
#    make && make install  && \
#    ln -s /usr/local/python3/bin/python3 /usr/sbin/python3 && ln -s /usr/local/python3/bin/pip3 /usr/sbin/pip3 
RUN cd /usr/local/src/  && \
    xz -d Python-3.5.1.tar.xz && tar xf Python-3.5.1.tar && cd Python-3.5.1  && ./configure --prefix=/usr/local/python3  && \
    make && make install  && \
    ln -s /usr/local/python3/bin/python3 /usr/sbin/python3 && ln -s /usr/local/python3/bin/pip3 /usr/sbin/pip3 

EXPOSE 22
