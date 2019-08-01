#!/bin/bash

service nginx stop

# letsencrypt 获取证书
sudo apt-get install -y letsencrypt

sudo letsencrypt certonly --standalone --agree-tos \
               --email example@gmail.com \
               -d $1 \
               -n

service nginx start
