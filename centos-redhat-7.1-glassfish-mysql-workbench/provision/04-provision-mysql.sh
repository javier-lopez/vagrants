#!/bin/sh
set -e
printf "%s\\n" "$0"

if ! command -v "mysql"; then
    if ! yum repolist enabled | grep "mysql.*-community.*" > /dev/null; then
        yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm || \
        yum -y install /vagrant/deploy/local_archive/mysql-community-release-el7-5.noarch.rpm
    fi
    yum repolist enabled | grep "mysql.*-community.*" > /dev/null
    yum -y install mysql-community-server || rpm -Uvh /vagrant/deploy/local_archive/mysql_pkgs/*.rpm
fi

#disable this on production
printf "%s\\n" "bind-address = 0.0.0.0" >> /etc/my.cnf
systemctl restart firewalld.service
firewall-cmd --permanent --zone=public --add-port=3306/tcp
systemctl restart firewalld.service

systemctl restart mysqld
systemctl enable mysqld.service

#user + scheme installation
DB="database"; DB_USER="user"; DB_PASSWD="passwd"
if ! mysql -uroot -p "${DB_PASSWD}" -Bse 'show databases' | grep "${DB}"; then
    printf "%s\\n" "User + db initialization"
    mysqladmin -u root password "${DB_PASSWD}" || :
    Q1="CREATE DATABASE IF NOT EXISTS ${DB};"
    Q2="GRANT USAGE ON *.* TO "${DB_USER}"@localhost IDENTIFIED BY '${DB_PASSWD}';"
    Q3="GRANT ALL PRIVILEGES ON ${DB}.* TO "${DB_USER}"@localhost;"
    Q4="FLUSH PRIVILEGES;"
    CREATE_USERS_SQL="${Q1}${Q2}${Q3}${Q4}"
    mysql -uroot -p "${DB_PASSWD}" -e "$CREATE_USERS_SQL"
    mysql -u "${DB_USER}" -p "${DB_PASSWD}" "${DB}" < /vagrant/deploy/local_archive/scripts/scheme.sql
fi
