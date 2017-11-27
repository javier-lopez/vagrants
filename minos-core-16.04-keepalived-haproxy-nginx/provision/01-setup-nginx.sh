#!/bin/sh

apt-get -y install nginx

cat > /var/www/html/index.html << E=O=F
<html><head><title>$(hostname -f)</title></head>
<body><h1>$(hostname -f)</h1></body></html>
E=O=F
