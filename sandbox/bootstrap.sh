#!/usr/bin/env bash

echo "# IPv4 and IPv6 localhost aliases:" | sudo tee /etc/hosts
echo "127.0.0.1 vagrant.docker.test.com  vagrant.docker.test  localhost" | sudo tee -a /etc/hosts
echo "::1       vagrant.docker.test.com  vagrant.docker.test  localhost" | sudo tee -a /etc/hosts
echo "10.0.2.15 vagrant.docker.test.com  vagrant.docker.test  localhost" | sudo tee -a /etc/hosts

# Update packages:
apt-get update

# Install nmap:
sudo apt-get install -y nmap

# Apache install:
#apt-get install -y apache2
#if ! [ -L /var/www ]; then
#  rm -rf /var/www
#  ln -fs /vagrant /var/www
#fi

# Installing PHP 7.2 and some extra libraries:
#sudo apt-get install -y php
#sudo apt-get install -y php-curl
#sudo apt-get install -y php-gd
#sudo apt-get install -y php-bcmath
#sudo apt-get install -y php-dev # This library required to compile PHP modules.

# Check loaded PHP modules:
#php -m

# Add DNS to /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# Install composer:
#cd /tmp/
#curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Install git:
sudo apt-get install -y git

# Check loaded PHP modules:
#echo "Loaded PHP extensions:"
#php -m




