#!/bin/sh
set -xe

#enable google repository and download chrome developer console
if [ ! -f /etc/apt/sources.list.d/google-chrome.list ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    printf "%s\\n" "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
fi

dpkg -l | grep squid-deb-proxy-client >/dev/null 2>&1 || \
    sudo apt-get install --no-install-recommends -y squid-deb-proxy-client

if ! command -v yarn >/dev/null 2>&1; then
    sudo apt-get install -y htop npm git openjdk-7-jdk ant expect lib32stdc++6 lib32z1 xterm automake autoconf python-dev google-chrome-stable
    sudo npm install -g n
    sudo n stable
    sudo npm install -g yarn
    sudo yarn self-update || :
fi
