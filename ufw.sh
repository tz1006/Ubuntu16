#!/bin/bash

sed -i '/DEFAULT_FORWARD_POLICY/s/DROP/ACCEPT/g' /etc/default/ufw

# ufw
sudo iptables -X
sudo ufw allow 22
sudo ufw allow 53
sudo ufw allow 80
#sudo ufw allow 443
#sudo ufw allow 500
#sudo ufw allow 4500
#sudo ufw allow 1701
#sudo ufw allow 1723
#iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -j MASQUERADE
#sudo iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE
sudo ufw -f disable && sudo ufw -f enable


