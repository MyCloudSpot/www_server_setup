#Select User
echo "Input the user you would like to add a new domain for"
read user_name

#Add Domain
echo "Input domain name without the www. Example: mycloudspot.com"
read domain_name

#Create Domain Directory
sudo mkdir /home/$user_name/www/$domain_name
sudo chown $user_name:$user_name /home/$user_name/www/$domain_name
sudo chmod 755 /home/$user_name/www/$domain_name
echo "$domain_name dir structure configured"

#Create Vhost 
sudo cp $BASEDIR/resources/domain_template /etc/apache2/sites-enabled/$domain_name
