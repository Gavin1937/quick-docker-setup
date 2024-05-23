#! /bin/bash -e

# Install docker & docker-compose
sudo yum update -y
sudo yum install docker -y
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

# Add user
sudo usermod -a -G docker "$USER"
newgrp docker

# Launch docker.service
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Testing
docker --version
docker-compose --version
docker run hello-world
