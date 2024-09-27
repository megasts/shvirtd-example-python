#!/bin/bash

if [ ! -d "/opt/shvirtd-example-python" ] ; then

    sudo git clone -b process https://github.com/megasts/shvirtd-example-python.git /opt/shvirtd-example-python

else

    cd /opt/shvirtd-example-python
    
    sudo git pull

fi

sudo docker compose -f /opt/shvirtd-example-python/compose.yaml up -d