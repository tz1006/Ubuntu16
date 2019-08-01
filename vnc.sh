#!/bin/bash


# lang
#sudo apt-get install -y language-pack-zh-han*
#sudo apt-get install -y  language-pack-gnome-zh-han*
#sudo apt-get install -y  language-pack-kde-zh-han*
#sudo apt install -y  $(check-language-support)


# gnome
sudo apt-get install -y ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal

# vnc
sudo apt-get install -y vnc4server

# init
/usr/bin/expect <<EOF
spawn vncserver
expect "Password:"
send "admin123\r"
expect "Verify:"
send "admin123\r"
expect eof
exit
EOF


echo '''gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &
# Fix to make GNOME work
export XKL_XMODMAP_DISABLE=1
/etc/X11/Xsession
''' >>  ~/.vnc/xstartup


sudo vnc4server -kill :1 && vnc4server

sudo sed "3a vncserver :1" -i /etc/rc.local

sudo ufw allow 5901
