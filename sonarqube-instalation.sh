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
create user sonar with password 'sonar';
create database sonardb;
grant all privileges on database sonardb to sonar;
\l
alter database sonardb owner to sonar;
\l
exit

#sonarqube instalation
psql -U sonar -d sonardb -h 127.0.0.1 -W
sonar
