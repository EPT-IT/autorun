#!/bin/sh
#This is a script to automate the process of creating a user with the correct flags for NTNU

#This adds colors to the script
BLACK='\033[30m'
RED='\033[31m'
GREEN='\033[32m'
ORANGE='\033[33m'
BLUE='\033[34m'
PURPLE='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'
NC='\033[0m' # No Color

#The line bellow shows colors
#echo ${BLACK}BLACK ${RED}RED ${GREEN}GREEN ${ORANGE}ORANGE ${BLUE}BLUE ${PURPLE}PURPLE ${CYAN}CYAN ${WHITE}WHITE ${NC}NC




# Ask the user for their username
echo -e ${CYAN}Please input a Username:${NC}
read inputusername
username=$(echo $inputusername | tr '[:upper:]' '[:lower:]')
echo -e ${ORANGE}Username has been set to ${GREEN}$username
echo ""

# Ask the user for their name
echo -e ${CYAN}Please input their full name:${NC}
read inputfullname
echo -e ${ORANGE}Full name is ${GREEN}$inputfullname
echo ""

# Ask the user for their uid
echo -e -n ${CYAN}Please input the UID:${NC}
read inputuid
if [[ $inputuid =~ ^[[:digit:]]+$ ]];then
echo -e ${ORANGE}The UID is ${GREEN}$inputuid ${NC}
else
echo -e ${RED}No or invalid UID has been selected, UID has been skipped.${NC}
fi
echo ""

# Add user with flags based on input
if [[ $inputuid =~ ^[[:digit:]]+$ ]];then
sudo useradd --create-home --user-group --groups adm,cdrom,sudo,dip,plugdev,lpadmin,lxd,sambashare --uid $inputuid --comment "$inputfullname" $username
echo -e ${ORANGE}User ${GREEN}$username ${ORANGE}has been created for ${GREEN}$inputfullname ${ORANGE}with the UID ${GREEN}$inputuid${NC}
else
sudo useradd --create-home --user-group --groups adm,cdrom,sudo,dip,plugdev,lpadmin,lxd,sambashare --comment "$inputfullname" $username
echo -e ${ORANGE}User ${GREEN}$username ${ORANGE}has been created for ${GREEN}$inputfullname ${ORANGE}without any ${RED}UID${NC}
fi


# Set password for user
sudo passwd $username

# Update
sudo apt update
sudo apt install net-tools
sudo apt install htop
sudo apt install gparted
sudo apt install neofetch
# Upgrade
sudo apt upgrade
