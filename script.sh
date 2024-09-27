#!/bin/bash
cd /opt
git clone -b process https://github.com/megasts/shvirtd-example-python.git 
cd shvirtd-example-python
docker compose up -d