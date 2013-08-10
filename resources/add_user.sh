#!/bin/bash

#Add User
echo "Input User Name:"
read user_name
sudo adduser $user_name

#Modify User Directory and Create Chained www Location
echo "Modifying user directory and chaining user to it"
sudo chown root:$user_name /home/$user_name
sudo chmod 755 /home/$user_name
sudo usermod -d /home/$user_name $user_name
sudo usermod -s /bin/false $user_name
sudo usermod -G sftponly $user_name

#Making directory for www files and giving user ownership
echo "Creating WWW directory for domains"
sudo mkdir /home/$user_name/www
sudo chmod 755 /home/$user_name/www
sudo chown $user_name:$user_name /home/$user_name/www

#Creating log file directory
echo "Creating log file directory"
sudo mkdir /home/$user_name/www/logs
sudo chmod 755 /home/$user_name/www/logs
sudo chown $user_name:$user_name /home/$user_name/www/logs

#Removing uneeded files in user home directory
echo "Removing uneeded files in user home directory"
sudo rm -r /home/$user_name/.bash*
sudo rm -r /home/$user_name/.profile
sudo rm -r /home/$user_name/.cache/

#Done
echo "All done adding the WWW user."

