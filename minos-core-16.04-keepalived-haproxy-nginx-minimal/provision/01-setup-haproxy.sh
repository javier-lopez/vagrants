#!/bin/sh

apt-get -y install haproxy

cat > /etc/default/haproxy <<E=O=F
# Set ENABLED to 1 if you want the init script to start haproxy.
ENABLED=1
# Add extra flags here.
#EXTRAOPTS="-de -m 16"
E=O=F

cat > /etc/haproxy/haproxy.cfg <<E=O=F
global
    log 127.0.0.1   local0
    log 127.0.0.1   local1 notice
    daemon
    maxconn 256

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    retries 3
    option redispatch
    timeout connect 5000ms
    timeout client 50000ms
    timeout server 50000ms

frontend http-in
    bind *:80
    default_backend webservers

backend webservers
    mode http
    stats enable
    # stats auth admin:admin
    stats uri /haproxy?stats
    balance roundrobin
    balance roundrobin
    # Poor-man's sticky
    # balance source
    # JSP SessionID Sticky
    # appsession JSESSIONID len 52 timeout 3h
    #option httpchk #default POST method works for apache2 and probably other webservers
    option httpchk HEAD / HTTP/1.1\r\nHost:\ localhost #for nginx
    option forwardfor
    option http-server-close
    server nginx-01 10.10.10.14:80 maxconn 32 check
    server nginx-02 10.10.10.15:80 maxconn 32 check
    server nginx-03 10.10.10.16:80 maxconn 32 check
E=O=F

service haproxy restart
