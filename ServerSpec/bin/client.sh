#!/bin/bash

yum -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm

yum -y install mariadb-server mariadb
systemctl start mariadb
systemctl enable mariadb

for file in /vagrant/sql/*.sql
do
  mysql -u root <$file
done

sed -i 's/PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd
