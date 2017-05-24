#!/bin/sh
set -xe

if ! command -v "mysql"; then
    if ! sudo yum repolist enabled | grep "mysql.*-community.*" > /dev/null; then
        sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm || \
        sudo yum -y install /vagrant/deploy/local_archive/mysql-community-release-el7-5.noarch.rpm
    fi
    sudo yum repolist enabled | grep "mysql.*-community.*" > /dev/null
    sudo yum -y install mysql-community-server || sudo rpm -Uvh /vagrant/deploy/local_archive/mysql_pkgs/*.rpm
fi

#disable this on production
printf "%s\\n" "bind-address = 0.0.0.0" | sudo tee -a /etc/my.cnf
sudo systemctl restart firewalld.service
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo systemctl restart firewalld.service

sudo systemctl restart mysqld
sudo systemctl enable mysqld.service

#user + scheme installation
#DB="emotic"; DB_USER="javanes"; DB_PASSWD="Ach1z0#d"
#if ! mysql -uroot -Bse 'show databases' | grep "${DB}"; then
    #printf "%s\\n" "User + db initialization"
    #mysqladmin -u root password "${DB_PASSWD}" || :
    #Q1="CREATE DATABASE IF NOT EXISTS ${DB};"
    #Q2="GRANT USAGE ON *.* TO "${DB_USER}"@localhost IDENTIFIED BY '${DB_PASSWD}';"
    #Q3="GRANT ALL PRIVILEGES ON ${DB}.* TO "${DB_USER}"@localhost;"
    #Q4="FLUSH PRIVILEGES;"
    #CREATE_USERS_SQL="${Q1}${Q2}${Q3}${Q4}"
    #mysql -uroot -e "$CREATE_USERS_SQL"
    #mysql -u "${DB_USER}" -p "${DB_PASSWD}" "${DB}" < /vagrant/deploy/local_archive/scripts/emotic_dump.sql
#fi
