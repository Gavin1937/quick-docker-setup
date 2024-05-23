#! /bin/bash -e

# Collect metadata
OSNAME=$(cat "/etc/*-release" | grep -e ^ID= | cut -d '=' -f 2)
echo "OS name: $OSNAME"

# Add Docker's official GPG key:
sudo apt update -y
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL "https://download.docker.com/linux/$OSNAME/gpg" | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] "https://download.docker.com/linux/$OSNAME" \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y

# Install docker & docker-compose
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

# Add user
sudo usermod -a -G docker "$USER"
newgrp docker

# Testing
docker --version
docker-compose --version
docker run hello-world
