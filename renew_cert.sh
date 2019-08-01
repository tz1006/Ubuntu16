#!/bin/bash

sudo service nginx stop

# 
sudo certbot renew

sudo service nginx start

sudo ipsec reload

