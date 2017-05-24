#!/bin/sh

#https://docs.mongodb.org/v3.0/tutorial/install-mongodb-on-ubuntu/
sudo locale-gen UTF-8
sudo apt-get update && sudo apt-get install squid-deb-proxy-client #accelerate download process if there is a local apt-proxy nearby
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org=3.0.10 mongodb-org-server=3.0.10 mongodb-org-shell=3.0.10 mongodb-org-mongos=3.0.10 mongodb-org-tools=3.0.10
echo "mongodb-org hold"        | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold"  | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold"  | sudo dpkg --set-selections
sudo service mongod restart
