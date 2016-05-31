#!/bin/bash

#New patches
yum update -y --exclude=kernel

#Install Tools
yum install -y nano git unzip screen

#Install Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start


#php
yum install -y php php-cli php-common php-devel php-mysql

#mysql
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysql
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

#Download start content

cd /vagrant

sudo -u vagrant wget -q https://raw.githubusercontent.com/vraja0106/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/vraja0106/vagrant/master/files/info.php

service httpd restart
