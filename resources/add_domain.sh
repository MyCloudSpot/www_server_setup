#Select User
clear
echo "List of WWW users on the system"
echo "----------------"
echo ""
sudo ls /home/
echo ""
echo "----------------"
echo ""
echo "Input the user name you would like to add a new domain for."
read user_name

#Get ServerAdmin Email Address
echo ""
echo "Input the email address for the domain admin."
read email_address

#Add Domain
echo ""
echo "Input domain name without the www. Example: mycloudspot.com"
read domain_name

#Vhost setup
echo ""
echo "Input domain name without the www. or .tld to setup the vhost file Example: mycloudspot"
read vhost_file 

#Create Domain Directory
sudo mkdir /home/$user_name/www/$domain_name
sudo chown $user_name:$user_name /home/$user_name/www/$domain_name
sudo chmod 755 /home/$user_name/www/$domain_name

#Create Error Log File
sudo touch /home/$user_name/www/logs/$domain_name-error_log
sudo chown $user_name:$user_name /home/$user_name/www/logs/$domain_name-error_log
sudo chmod 755 /home/$user_name/www/logs/$domain_name-error_log

#Create Access Log File
sudo touch /home/$user_name/www/logs/$domain_name-access_log
sudo chown $user_name:$user_name /home/$user_name/www/logs/$domain_name-access_log
sudo chmod 755 /home/$user_name/www/logs/$domain_name-access_log

echo "Directory and log files created for $domain_name"

# Create the file with VirtualHost configuration in /etc/apache2/site-enabled/
echo "#$domain_name
<VirtualHost *:80>
        ServerAdmin $email_address 
        DocumentRoot /home/$user_name/www/$domain_name
        ServerName www.$domain_name
        ErrorLog /home/$user_name/www/logs/$domain_name-error_log
        TransferLog /home/$user_name/www/logs/$domain_name-access_log
</VirtualHost>

<VirtualHost *:80>
        ServerAdmin $email_address 
        DocumentRoot /home/$user_name/www/$domain_name
        ServerName $domain_name 
        ErrorLog /home/$user_name/www/logs/$domain_name-error_log
        TransferLog /home/$user_name/www/logs/$domain_name-access_log
</VirtualHost>
" > $vhost_file

sudo mv $vhost_file /etc/apache2/sites-enabled/$vhost_file

sudo apache2ctl restart

echo ""
echo "$domain_name is ready for use!"
