#!/bin/bash

#mysql
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysql
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";
