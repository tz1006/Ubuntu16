#!/bin/bash


# init
sudo bash init.sh

# ufw
sudo bash ufw.sh

# python3
sudo bash python3.sh

# ssl
sudo bash letsencrypt.sh  $(hostname)

# ikev2
sudo bash strongswan.sh

# shadowsocks
sudo bash shadowsocks.sh

# vnc
sudo bash vnc.sh


reboot
