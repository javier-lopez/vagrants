#!/bin/sh
set -e
printf "%s\\n" "$0"

distro="$(awk 'NF==1 {print $1; exit}' /etc/os-release)"

printf "%s\\n" "enabling epel-release on ${distro}"
case "${distro}" in
    *centos*) yum -y install epel-release || yum -y install /vagrant/deploy/local_archive/epel-release-latest-7.noarch.rpm
             ;;
       *Red*) wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm -O /usr/src/epel-release-7-5.noarch.rpm
              yum -y install /usr/src/epel-release-7-5.noarch.rpm
              ;;
esac
