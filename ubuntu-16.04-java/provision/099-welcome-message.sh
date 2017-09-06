#!/bin/sh

cat > ~/.welcome-msg << E=O=F

# Quick start

## Usage

    $ java -version
$(java -version 2>&1 | awk '{print "      " $0}')

Happy programming!
E=O=F

grep 'cat ~/.welcome-msg' ~/.bashrc >/dev/null 2>&1 || \
    printf "%s\\n" "cat ~/.welcome-msg" >> ~/.bashrc
