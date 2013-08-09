#!/bin/bash
#Original Code: https://github.com/kbond/lamp-setup
#Modified By: https://github.com/MyCloudSpot

BASEDIR=$(dirname $0)

echo "Installing Apache"
sudo apt-get install apache2 apache2-utils
sudo a2enmod rewrite vhost_alias

echo "Installing PHP"
sudo apt-get install php5 libapache2-mod-php5 php5-cli php5-xdebug php-pear

echo "Restarting Apache"
sudo apache2ctl restart

echo "Installing MySQL"
sudo apt-get install mysql-server
sudo apt-get install libapache2-mod-auth-mysql php5-mysql phpmyadmin

echo "Removing 000-default to prep for virtualhosts"
sudo a2dissite 000-default
sudo rm /etc/apache2/sites-available/000-default

echo "Restarting Apache"
sudo apache2ctl restart
