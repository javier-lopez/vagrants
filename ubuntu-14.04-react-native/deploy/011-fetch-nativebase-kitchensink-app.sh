#!/bin/sh
set -xe

[ -d /vagrant ] && cd /vagrant
[ -d ./examples ] || mkdir examples
cd examples
[ -d ./nativebase-kitchensink/.git ] || git clone https://github.com/GeekyAnts/NativeBase-KitchenSink nativebase-kitchensink
cd nativebase-kitchensink
git reset --hard 01ba028
