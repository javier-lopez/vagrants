#!/bin/sh
set -e
printf "%s\\n" "$0"

glassfish_zip="glassfish-as-7.1.1.Final.zip"
glassfish_dir="glassfish-as-7.1.1.Final"
glassfish_user="glassfish"

if [ ! -f /usr/src/"${glassfish_zip}" ]; then
    yum -y install wget unzip
    wget --progress=bar:force http://download.glassfish.org/glassfishas/7.1/"${glassfish_dir}"/"${glassfish_zip}" -O /usr/src/"${glassfish_zip}"
fi

adduser -r "${glassfish_user}"
mkdir   -p /home/"${glassfish_user}"
chown   -R "${glassfish_user}":"${glassfish_user}" /home/"${glassfish_user}"

firewall-cmd --permanent --zone=public --add-port=4343/tcp
systemctl restart firewalld.service
