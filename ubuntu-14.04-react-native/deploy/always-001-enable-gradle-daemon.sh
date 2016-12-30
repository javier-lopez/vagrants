#!/bin/sh
set -xe

#enable the gradle daemon
[ -d ~/.gradle ] || mkdir ~/.gradle
grep 'org.gradle.daemon=true' ~/.gradle/gradle.properties >/dev/null 2>&1 || \
    printf "%s\\n" "org.gradle.daemon=true" > ~/.gradle/gradle.properties
