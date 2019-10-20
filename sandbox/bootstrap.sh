#!/usr/bin/env bash

echo "# IPv4 and IPv6 localhost aliases:" | sudo tee /etc/hosts
echo "127.0.0.1 vagrant.docker.test.com  vagrant.docker.test  localhost" | sudo tee -a /etc/hosts
echo "::1       vagrant.docker.test.com  vagrant.docker.test  localhost" | sudo tee -a /etc/hosts
echo "10.0.2.15 vagrant.docker.test.com  vagrant.docker.test  localhost" | sudo tee -a /etc/hosts

# Update packages:
sudo apt-get update

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

# Docker install:
# ===============

# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install -y apt-transport-https
sudo apt-get install -y ca-certificates
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y curl
sudo apt-get install -y gnupg-agent 
sudo apt-get install -y software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

# Set up the stable repository:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update packages:
sudo apt-get update

# Install the latest version of Docker Engine - Community and containerd, or go to the next step to install a specific version:
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# List the versions available in your repo:
apt-cache madison docker-ce

# TODO:  Install a specific version using the version string from the second column

# Create the docker group:
sudo groupadd docker

# Add your user to the docker group:
sudo usermod -aG docker $USER

# TODO: here need logout and login

# docker run hello-world

# docker-compose install:
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0-rc2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

