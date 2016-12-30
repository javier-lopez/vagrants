#!/bin/sh
set -xe

[ -d /vagrant ] && cd /vagrant
[ -d ./examples ] || mkdir examples
cd examples
[ -d ./pepperoni-app-kit/.git ] && (cd pepperoni-app-kit && git pull) || git clone https://github.com/futurice/pepperoni-app-kit
cd pepperoni-app-kit
#git reset --hard 01ba028
