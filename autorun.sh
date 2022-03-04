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

#The line bellow shows colors, comment out once done
echo ${BLACK}BLACK ${RED}RED ${GREEN}GREEN ${ORANGE}ORANGE ${BLUE}BLUE ${PURPLE}PURPLE ${CYAN}CYAN ${WHITE}WHITE ${NC}NC




# Ask the user for their username
echo ${CYAN}Please input a Username:${NC}
read inputusername
username=$(echo $inputusername | tr '[:upper:]' '[:lower:]')
echo ${ORANGE}Username has been set to ${GREEN}$username
echo ""

# Ask the user for their name
echo ${CYAN}Please input their full name:${NC}
read inputfullname
echo ${ORANGE}Full name is ${GREEN}$inputfullname
echo ""

# Ask the user for their uid
echo -n ${CYAN}Please input the UID:${NC}
read inputuid
if [[ $inputuid =~ ^[[:digit:]]+$ ]];then
echo ${ORANGE}The UID is ${GREEN}$inputuid ${NC}
else
echo ${RED}No or invalid UID has been selected, UID had been skipped.${NC}
fi
echo ""
