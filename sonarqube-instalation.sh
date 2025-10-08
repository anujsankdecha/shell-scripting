#sonarkube instalation script
#!/bin/bash

#java instalation
yum update -y
yum install java-21-openjdk* -y
java -version

#postgresql instalation
sudo dnf module enable postgresql:15 -y
sudo dnf install -y postgresql-server postgresql
sudo postgresql-setup --initdb
sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo systemctl status postgresql

#creating user and database
su postgres
psql 

# after entering psql shell, done by self