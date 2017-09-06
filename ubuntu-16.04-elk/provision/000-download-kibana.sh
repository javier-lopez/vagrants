#!/bin/sh
set -xe

#wget https://artifacts.elastic.co/downloads/kibana/kibana-5.4.0-linux-x86_64.tar.gz
cp /opt/provision/archive/kibana*.tar.gz ~
tar zxf kibana*.tar.gz
