#!/bin/bash

clear

#BASEDIR=$(dirname $0)

#What do you want to do?
echo "Please select an action by entering number below."
echo ""
echo "+++++++++++++++++++++++++++"
echo "INSTALL"
echo "+++++++++++++++++++++++++++"
echo "1: Install Apache2, MySQL, PHP & PHPMyAdmin" 
echo "2: Install Vim & Git"
echo ""
echo "+++++++++++++++++++++++++++"
echo "SCRIPTS"
echo "+++++++++++++++++++++++++++"
echo "3: Add User"
echo ""
echo "+++++++++++++++++++++++++++"
echo "EXIT PROGRAM"
echo "+++++++++++++++++++++++++++"
echo "0: Exit"
echo ""
echo "Input a number and press enter."
read dir 



if [ "$dir" = "0" ]; then
exit
fi

if [ "$dir" = "1" ]; then
./$BASEDIR/resources/www_server_setup.sh
fi

if [ "$dir" = "2" ]; then
./$BASEDIR/resources/developer_tools.sh
fi

if [ "$dir" = "3" ]; then
./$BASEDIR/resources/add_site.sh
fi

