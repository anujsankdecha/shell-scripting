#!/bin/bash
cd /etc/yum.repos.d/

# Downloading the Docker repository file
wget -O docker.repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce --nobest -y
cd~
systemctl start docker
systemctl enable docker
systemctl status docker

# Pulling the latest httpd image from Docker Hub
docker run -dit --name webserver -p 80:80 httpd:latest  
docker ps -a

docker rm -f webserver
docker image rm httpd:latest
docker rmi $(docker images -a -q)

# Checking the installed Docker version
docker --version    

echo "docker installation complete"