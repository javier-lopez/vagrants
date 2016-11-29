#!/bin/sh

#https://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
locale-gen UTF-8
apt-get update && apt-get install squid-deb-proxy-client #accelerate download process if there is a local apt-proxy nearby
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update && apt-get install -y mongodb-org
service mongod restart
