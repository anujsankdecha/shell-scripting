#sonarkube instalation script
#!/bin/bash

yum update -y
yum install java-21-openjdk* -y
java -version

#yum install postgresql
yum install postgresql16* -y
systemctl start postgresql
systemctl enable postgresql

#creating user and database