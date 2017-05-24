#!/bin/sh
set -xe

sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
