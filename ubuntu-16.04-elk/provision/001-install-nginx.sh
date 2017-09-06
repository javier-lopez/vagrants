#!/bin/sh
set -xe

sudo apt-get install --no-install-recommends -y nginx

sudo tee "/etc/nginx/sites-enabled/default" << 'E=O=F'
server {
    listen 80;

    server_name elk.example.com;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
E=O=F

sudo service nginx restart
