#!/bin/bash


# shadowsocks
sudo pip3 install shadowsocks

sudo cp config/shadowsocks.conf  /etc/shadowsocks.conf

sed -i '$i\ssserver -c /etc/shadowsocks.conf -d start' /etc/rc.local

ssserver -c /etc/shadowsocks.conf -d start

sudo ufw allow 2333
