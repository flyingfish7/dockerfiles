#
# MAINTAINER        Carson,C.J.Zeong <zcy@nicescale.com>
# DOCKER-VERSION    1.10.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       sinobyte/centos_base:7.2.1511.2
MAINTAINER pp

ENV TZ "Asia/Shanghai"
ENV TERM linux
ENV LANG "en_US.UTF-8"



#ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
#ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo
ADD my.cnf /etc/my.cnf

RUN yum install -y curl wget tar bzip2 unzip vim sudo yum-utils net-tools man sshd && \
    yum install -y gcc gcc-c++ git make automake cmake python-devel && \
    yum install -y ncurses-devel cmake bison && \
    yum clean all

RUN mkdir /data && useradd mysql -d /data/mysql -s /sbin/nologin

COPY mysql-5.6.19.tar.gz /usr/local/src/

RUN cd /usr/local/src && tar zxf mysql-5.6.19.tar.gz && cd mysql-5.6.19  && \
    cmake .                               \
    -DCMAKE_INSTALL_PREFIX=/data/mysql    \
    -DMYSQL_DATADIR=/data/mysql/data      \
    -DSYSCONFDIR=/etc                    \
    -DWITH_MYISAM_STORAGE_ENGINE=1       \
    -DWITH_INNOBASE_STORAGE_ENGINE=1     \
    -DWITH_MEMORY_STORAGE_ENGINE=1       \
    -DMYSQL_UNIX_ADDR=/tmp/mysqld.sock   \
    -DMYSQL_TCP_PORT=3306                \
    -DENABLED_LOCAL_INFILE=1             \
    -DWITH_PARTITION_STORAGE_ENGINE=1    \
    -DEXTRA_CHARSETS=all                 \
    -DDEFAULT_CHARSET=utf8               \
    -DDEFAULT_COLLATION=utf8_general_ci && make && make install

ADD scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh
VOLUME ["/data/mysql/data/"]
EXPOSE 22 3306
ENTRYPOINT  ["/root/start.sh"]
