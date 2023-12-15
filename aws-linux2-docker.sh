#! /bin/bash -x

# Install docker & docker-compose
sudo yum update -y
sudo yum install docker -y
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# add user
sudo usermod -a -G docker "$USER"

# testing
docker --version
docker-compose --version
docker run hello-world
