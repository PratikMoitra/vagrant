#!/bin/bash

#This script creates ana accoint on the local system.
# you will be prompted for the username and the password.

# Check Root Privilages to execute this script else exit
if [[ "${UID}" != 0 ]]
then
  echo "You need to be a Root to execute this Script, Please consider Sudo Account."
  exit 1
fi

# Ask for the username
read -p 'Enter a username to Create: ' USER_NAME
# Ask for the real name.
read -p 'Enter the Full name of the User you want to create: ' COMMENT
# Ask for the password.
# read -p 'Enter the password for the user: ' PASSWORD
# Create the User.
useradd -c "${COMMENT}" -m ${USER_NAME} > /dev/null
# set the password for the user.
PASSWORD=$(echo "${USER_NAME}${RANDOM}" | sha256sum | head -c10 )
echo ${PASSWORD} | passwd --stdin ${USER_NAME} > /dev/null
# Force password change on the first login.
passwd -e ${USER_NAME} > /dev/null
echo "User : ${USER_NAME}, has been Created Succesfully with the Password : ${PASSWORD}"
exit 0
# Force password change on the first login.
