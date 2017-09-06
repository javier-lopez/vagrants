#!/bin/sh

cat > ~/.welcome-msg << 'E=O=F'

# Quick start

## Usage

    # launch daemons
    $ ~/elastic*/bin/elasticsearch
    $ ~/kibana*/bin/kibana
    $ ~/logstash*/bin/logstash -f /opt/provision/config/logstash_files.conf  --config.reload.automatic

    # populate /var/log/elk/
    # go to http://localhost:80

    # reset data
    $ curl --user elastic:changeme -XDELETE 'http://localhost:9200/_all'

Happy logging!
E=O=F

grep 'cat ~/.welcome-msg' ~/.bashrc >/dev/null 2>&1 || \
    printf "%s\\n" "cat ~/.welcome-msg" >> ~/.bashrc
