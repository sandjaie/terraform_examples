#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install
apt-get update
apt-get -y install nginx python-pip supervisor

# make directory
mkdir -p /etc/tailon
touch /var/log/tailon-log.log

# install tailon
pip install tailon

# make sure nginx is started
service nginx start
