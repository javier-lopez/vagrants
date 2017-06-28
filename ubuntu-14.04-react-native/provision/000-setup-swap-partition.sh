#!/bin/sh
set -xe

swapsize="2G"

#does the swap file/partition already exist?
if [ "$(swapon -s | wc -l)" -gt "1" ]; then
    printf "%s\\n" 'Swapfile found. No changes made.'
    swapon -s
else
    printf "%s\\n" 'Swapfile missing. Setting it up ...'
    sudo fallocate -l "${swapsize}" /swapfile
    sudo chmod 600  /swapfile
    sudo mkswap     /swapfile
    sudo swapon     /swapfile
    printf "%s\\n" '/swapfile none swap defaults 0 0' | sudo tee -a /etc/fstab
fi
