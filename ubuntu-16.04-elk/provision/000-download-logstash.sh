#!/bin/sh
set -xe

#wget https://artifacts.elastic.co/downloads/logstash/logstash-5.4.0.tar.gz
cp /opt/provision/archive/logstash*.tar.gz ~
tar zxf logstash*.tar.gz
