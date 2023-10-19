#!/bin/bash

echo "---x---Adding Java Repository---x---"
sudo apt update && sudo apt upgrade -y

echo "---x---Installing Java 17---x---"
sudo apt install openjdk-17-jdk -y

#sudo apt install unzip

echo "---x---Setting Java Environment Variables---x---"
echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-arm64/" >> ~/.bashrc
echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc

# Refresh the current shell to recognize the changes made in .bashrc
source ~/.bashrc

echo "---x---Installing Maven---x---"
sudo apt install maven -y

echo "---x---Installing PostgreSQL---x---"
sudo apt install postgresql postgresql-contrib -y

# Start and enable PostgreSQL to start on boot
sudo systemctl start postgresql
sudo systemctl enable postgresql

#!/bin/bash

# Create a PostgreSQL database



# Configure PostgreSQL: set password, create database, and create user
sudo -u postgres psql -c "create user  cjoshi with password 'cjoshi'" # --noninteractive --pwprompt
sudo -u postgres psql -c "ALTER USER cjoshi WITH superuser;"
sudo -u postgres psql -c "create database cjoshi"
sudo -u postgres psql -c "grant all privileges on database cjoshi to cjoshi;"
#sudo -U postgres psql -c "ALTER USER myuser WITH SUPERUSER"