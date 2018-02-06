#!/bin/sh
set -xe

if ! command -v "docker" >/dev/null 2>&1; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-get install -y software-properties-common apt-transport-https
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce
fi

#don't require sudo to run docker
sudo usermod -aG docker ${USER} || :
sudo docker -v

#workaround to force vagrant to reconnect and allow the vagrant user to use docker
ps aux | grep 'sshd:' | awk '{print $2}' | sudo xargs kill
