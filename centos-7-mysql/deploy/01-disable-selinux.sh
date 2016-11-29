#!/bin/sh
set -e
printf "%s\\n" "$0"

setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
