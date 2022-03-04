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

# Add user with flags based on input

if [[ $inputuid =~ ^[[:digit:]]+$ ]];then
sudo useradd --create-home --user-group --groups adm,cdrom,sudo,dip,plugdev,lpadmin,lxd,sambashare --uid $inputuid --comment "$inputfullname" $inputusername

else
sudo useradd --create-home --user-group --groups adm,cdrom,sudo,dip,plugdev,lpadmin,lxd,sambashare --comment "$inputfullname" $inputusername
fi


# Set password for user
sudo passwd $inputusername

# Update
sudo apt update
sudo apt upgrade
