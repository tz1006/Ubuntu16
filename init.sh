#!/bin/bash

sudo apt update -y

# wget git
sudo apt install -y wget git 

# rc

# sysctl
sed -i '/net.ipv4.ip_forward/c net.ipv4.ip_forward = 1' /etc/sysctl.conf
sudo sysctl -p

# renew-ssl
sudo echo "* * * */2 *  sudo bash /opt/Ubuntu16/renew-ssl.sh >/var/log/renew-ssl.log 2>&1" >> /var/spool/cron/root

# Disable AppArmor
sudo systemctl stop apparmor
sudo systemctl disable apparmor
#sudo /etc/init.d/apparmor stop
#sudo update-rc.d -f apparmor remove
