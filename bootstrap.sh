#!/usr/bin/env bash

rm -rf /var/www
ln -fs /vagrant /var/www

apt-get update >/dev/null 2>&1

# Install MySQL
MYSQL_PASSWORD=password
echo mysql-server-5.5 mysql-server/root_password password $MYSQL_PASSWORD | debconf-set-selections
echo mysql-server-5.5 mysql-server/root_password_again password $MYSQL_PASSWORD | debconf-set-selections
apt-get install -y mysql-server >/dev/null 2>&1

# Install Git
apt-get install -y git >/dev/null 2>&1

# Install GoLang
wget -P /tmp https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz > /dev/null 2>&1
sudo tar zxvf /tmp/go1.4.2.linux-amd64.tar.gz -C /usr/local > /dev/null 2>&1
cat <<EOF >> /home/vagrant/.bashrc
# GoLang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
EOF

# activate bashrc
source /home/vagrant/.bashrc



# *** extention ***

# go packege
go get github.com/mattn/gorem
go get github.com/mattn/goreman
