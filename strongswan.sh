#!/bin/bash

sudo apt install -y strongswan libstrongswan-extra-plugins

# 配置文件
sudo cp config/ipsec.secrets  /etc/ipsec.secrets
sudo cp config/ipsec.conf  /etc/ipsec.conf
sudo cp config/strongswan.conf  /etc/strongswan.conf
sudo cp config/charon-logging.conf  /etc/strongswan.d/charon-logging.conf

# 替换　example.com
sed -i "s/example.com/$(hostname)/g" /etc/ipsec.conf
sed -i "s/example.com/$(hostname)/g" /etc/ipsec.secrets

# 证书
wget https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem -O /etc/ipsec.d/cacerts/cacert.pem

# UFW
interfaces=$(ls /sys/class/net)
netcard=${interfaces%lo*}
#netcard_count=$(expr ${#netcard} - 1)
#netcard1=${netcard:2:3}
netcard=${netcard::$(expr ${#netcard} - 1)}
sed -i '$i\iptables -t nat -A POSTROUTING -o NETCARD -j MASQUERADE'  /etc/rc.local
sed -i "/POSTROUTING/s/NETCARD/$netcard/g" /etc/rc.local
#sudo sed "3a sudo iptables -t nat -A POSTROUTING -o $netcard -j MASQUERADE" -i /etc/rc.local
sudo iptables -t nat -A POSTROUTING -o $netcard -j MASQUERADE
#sed -i  "s/rc.local/&111/" /etc/rc.local


sudo ufw allow 500
sudo ufw allow 4500
sudo ufw allow 1723


#sudo iptables -A FORWARD -s 10.0.0.0/24 -j ACCEPT
#sudo iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE
