#!/bin/bash


echo "Setup www dir"
sudo cp "$BASEDIR/resources/dev" /etc/apache2/sites-available/
sudo a2ensite dev
sudo apache2ctl restart

