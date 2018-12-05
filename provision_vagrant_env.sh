#!/bin/bash

apt-get update && apt-get install -y build-essential \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Remove previous verstions of docker
apt-get remove docker docker-engine docker.io
# Install current docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update && apt-get install -y docker-ce

#  Install docker-compose
#curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose