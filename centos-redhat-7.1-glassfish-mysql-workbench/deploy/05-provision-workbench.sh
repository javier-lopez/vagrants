#!/bin/sh
set -e
printf "%s\\n" "$0"

if ! yum repolist enabled | grep "mysql.*-community.*" > /dev/null; then
    yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm || \
    yum -y install /vagrant/deploy/local_archive/mysql-community-release-el7-5.noarch.rpm
fi
yum repolist enabled | grep "mysql.*-community.*" > /dev/null
yum -y install mysql-workbench-community || rpm -Uvh /vagrant/deploy/local_archive/workbench_pkgs/*.rpm
