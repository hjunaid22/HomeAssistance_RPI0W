#!/bin/bash
echo "What would you like to call this host"
read "hostname"

echo "alias ll='ls -al'" >> /etc/profile
######## installing Packages ###########
sudo apt-get install dnsutils -y #nslookup and dig
sudo apt-get install apache2 -y
apt-get update -y
apt-get install ca-certificates curl gnupg -y
apt-get install vim -y
####### Installing Docker ############
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/raspbian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg -y
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/raspbian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
apt-get upgrade -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
docker ps
