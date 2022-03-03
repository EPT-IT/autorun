#!/bin/bash
# Ask the user for their username
echo Please input a Username:
read inputusername
 
# Ask the user for their name
echo Please input their full name:
read inputfullname
 
# Ask the user for their uid
echo -n Please input the UID:
read inputuid
 
# Add user with flags and variables
sudo useradd --create-home --user-group --groups adm,cdrom,sudo,dip,plugdev,lpadmin,lxd,sambashare --uid $inputuid --password password --comment "$inputfullname" $inputusername

# Set password
Sudo psswd $inputusername

# Update
sudo apt update
sudo apt upgrade
