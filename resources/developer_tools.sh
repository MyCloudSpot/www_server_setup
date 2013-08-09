#!/bin/bash

echo "Installing Vim"
sudo apt-get install vim

echo "Installing git"
sudo apt-get install git

echo "Configurating git"
echo "Please input your --global user.name for git"
read name
echo "Please input your --global user.email for git"
read email
sudo git config --global user.name "$name"
sudo git config --global user.email "$email"

echo "All done...."
exit
