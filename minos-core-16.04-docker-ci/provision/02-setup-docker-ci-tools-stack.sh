#!/bin/sh

set -xe

if [ ! -d docker-ci-tool-stack ]; then
    git clone --recursive https://github.com/marcelbirkner/docker-ci-tool-stack
else
    (cd docker-ci-tool-stack && git pull)
fi

cd docker-ci-tool-stack
sh docker-compose.yml.native-docker-fix.sh
docker-compose -f docker-compose-selenium.yml up -d
docker-compose up -d
