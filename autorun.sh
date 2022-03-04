#This is a script to automate the process of creating a user with the correct flags for NTNU

# Ask the user for their username
echo Please input a Username:
read inputusername
username=$(echo $inputusername | tr '[:upper:]' '[:lower:]')
echo Username has been set to $username

# Ask the user for their name
echo Please input their full name:
read inputfullname
echo Full name is $inputfullname

# Ask the user for their uid
echo -n Please input the UID:
read inputuid
if [[ $inputuid =~ ^[[:digit:]]+$ ]];then
echo The UID is $inputuid
else
echo No or invalid UID has been selected, UID had been skipped.
fi

# Add user with flags based on input
if [[ $inputuid =~ ^[[:digit:]]+$ ]];then
sudo useradd --create-home --user-group --groups adm,cdrom,sudo,dip,plugdev,lpadmin,lxd,sambashare --uid $inputuid --comment "$inputfullname" $username
echo User $username has been created for $inputfullname with the UID $inputuid
else
sudo useradd --create-home --user-group --groups adm,cdrom,sudo,dip,plugdev,lpadmin,lxd,sambashare --comment "$inputfullname" $username
echo User $username has been created for $inputfullname without any UID
fi


# Set password for user
sudo passwd $username

# Update
sudo apt update
sudo apt upgrade
