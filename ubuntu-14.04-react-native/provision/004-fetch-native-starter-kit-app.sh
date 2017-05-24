#!/bin/sh
set -xe

if [ ! -d ~/native-starter-kit/.git ]; then
    git clone https://github.com/start-react/native-starter-kit
    (cd   ~/native-starter-kit && git reset --hard 2d79c6e)
fi
