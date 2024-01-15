#!/bin/bash
echo "What would you like to call this host"
read "hostname"

echo "alias='ls -al'" >> /etc/profile
######## installing Packages ###########
sudo apt-get install dnsutils #nslookup and dig
sudo apt-get install apache2
######
touch /home/h.junaid/.credentials
echo "username=download" >> /home/h.junaid/.credentials
chmod 600
sudo mkdir /backup
sudo echo "//192.168.1.5/Open_Share /backup cifs credentials=/home/h.junaid/.credentials,rw,uid=1001,gid=1001" >> /etc/fstab
sudo groupadd admin
sudo usermod -aG admin
########### Docker Installation #######
apt-get update
apt-get install ca-certificates curl gnupg -y
apt-get install vim -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/raspbian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg -y
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/raspbian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
apt-get upgrade
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker ps
