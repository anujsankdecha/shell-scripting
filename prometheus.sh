#!/bin/bash
# Prometheus installation script for CentOS/RHEL

mkdir promotheus
cd promotheus
wget wget https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz
tar -xzf prometheus-2.26.0.linux-amd64.tar.gz 
rm -rvf prometheus-2.26.0.linux-amd64.tar.gz     
cd prometheus-2.26.0.linux-amd64/

# Create a Prometheus user and necessary directories

useradd --no-create-home --shell /bin/false prometheus
mkdir /etc/prometheus
mkdir /var/lib/prometheus
chown prometheus:prometheus /var/lib/prometheus/

# Copy binaries and configuration files

cp -r console* /etc/prometheus/
cp -r prometheus.yml /etc/prometheus/
chown -R prometheus:prometheus /etc/prometheus/*
cp prometheus /usr/local/bin
cp promtool /usr/local/bin/
chown -R prometheus:prometheus /usr/local/bin/prometheus 
chown -R prometheus:prometheus /usr/local/bin/promtool 
    
# Create a systemd service file for Prometheus

vim /etc/systemd/system/prometheus.service
systemctl daemon-reload 
systemctl start promotheus.service
systemctl start prometheus.service
systemctl status prometheus.service
ss -tulpn

# Configure firewall to allow Prometheus port

firewall-cmd --permanent --add-port=9090/tcp
firewall-cmd --reload 

echo "Prometheus installation completed. Access it at http://<your_server_ip>:9090"