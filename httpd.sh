#!/bin/bash
yum install httpd -y
systemctl start httpd 
systemctl enable httpd
systemctl status httpd

firewall-cmd --permanent --add-service=http
firewall-cmd --reload

# Modifying SELinux to allow httpd to run on a non-standard port (85)
semanage port -a -t http_port_t -p tcp 85
semanage port -l | grep http

# Configuring the firewall to allow traffic on port 85
firewall-cmd --permanent --add-port=85/tcp
firewall-cmd --reload

# Creating a custom index.html file
echo "<h1>hello anuj</h1>" > /var/www/html/index.html

systemctl restart httpd

# Testing the httpd server on port 85
curl 192.168.0.100:85

echo "httpd installation complete on port 85"