yum install httpd -y
systemctl start httpd 
systemctl enable httpd
systemctl status httpd

firewall-cmd --permanent --add-service=http
firewall-cmd --reload

semanage port -a -t http_port_t -p tcp 85
semanage port -l | grep http

firewall-cmd --permanent --add-port=85/tcp
firewall-cmd --reload

echo "<h1>hello anuj</h1>" > /var/www/html/index.html

systemctl restart httpd

curl 192.168.0.100:85

echo "httpd installation complete on port 85"