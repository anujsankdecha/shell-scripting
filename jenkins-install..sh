#!/bin/bash
#installing java
sudo dnf install java-17-openjdk -y
java -version

# Adding the Jenkins repository and importing the GPG key
curl -fsSL https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key | sudo tee /etc/pki/rpm-gpg/RPM-GPG-KEY-jenkins
curl -fsSL https://pkg.jenkins.io/redhat-stable/jenkins.repo -o /etc/yum.repos.d/jenkins.repo
cat /etc/yum.repos.d/jenkins.repo

# Installing Jenkins
sudo dnf upgrade -y
sudo dnf install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins

# Configuring the firewall to allow Jenkins traffic on port 8080
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload


