#!/bin/sh
set -xe

#wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.4.0.tar.gz
cp /opt/provision/archive/elasticsearch*.tar.gz ~
tar zxf elasticsearch-*.tar.gz
