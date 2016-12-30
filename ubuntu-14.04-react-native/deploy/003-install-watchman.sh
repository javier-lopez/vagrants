#!/bin/sh
set -xe

if ! command -v "watchman" >/dev/null 2>&1; then
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:mwhiteley/watchman-daily
    sudo apt-get update
    sudo apt-get install watchman

    #git clone https://github.com/facebook/watchman.git
    #cd watchman
    #./autogen.sh
    #./configure
    #make
    #sudo make install
fi
