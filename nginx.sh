#!/bin/bash
# Script to install and configure nginx server on port 80

yum install nginx -y
systemctl start nginx
systemctl enable nginx
systemctl status nginx

firewall-cmd --permanent --add-service=nginx
firewall-cmd --reload

# Creating a custom index.html file
echo "<h1>hello anuj</h1>" > /usr/share/nginx/html/index.html
echo "<h2>Welcome to Nginx Server</h2>" >> /usr/share/nginx/html/index.html
systemctl restart nginx

# Testing the nginx server on port 80
curl 192.168.0.100:80

echo "nginx installation complete on port 80"