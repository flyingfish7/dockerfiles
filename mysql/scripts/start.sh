#!/bin/bash
set -e
CMD="/etc/init.d/mysql.server"
#########
mkdir /var/run/mysqld/ &&  chown mysql.mysql /var/run/mysqld
cd /data/mysql && chown mysql.mysql . -R
scripts/mysql_install_db --user=mysql --explicit_defaults_for_timestamp
mkdir /data/mysql/log/ && chown mysql.mysql /data/mysql/log 
cp support-files/mysql.server $CMD
export LANG=/data/mysql/bin:\$PATH
/bin/sh /data/mysql/bin/mysqld_safe --datadir=/data/mysql/data --pid-file=/data/mysql/data/mysqld.pid
