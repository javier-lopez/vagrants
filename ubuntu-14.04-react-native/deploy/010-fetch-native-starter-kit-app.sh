#!/bin/sh
set -xe

[ -d /vagrant ] && cd /vagrant
[ -d ./examples ] || mkdir examples
cd examples
[ -d ./native-starter-kit/.git ] || git clone https://github.com/start-react/native-starter-kit
cd native-starter-kit
git reset --hard 2d79c6e
