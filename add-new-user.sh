#!/bin/bash

# The script enables Linux admins to add new users

# 1. Check if the script is being executed as root
if [[ "${UID}" -ne 0 ]]
then
    echo "Execute the script as root"
    exit 1
fi

# Ask for user name
read -p 'Enter the user name : ' USER_NAME

# Ask for user password
read -p 'Enter the password : ' PASSWORD

# Ask for comment
read -p 'Enter the name of the person/application for the account : ' COMMENT

# Create user
useradd -c "${COMMENT}" -m "${USER_NAME}"
if [[ "${?}" -ne 0 ]]
then
    echo "User could not be added"
    exit 1
fi

# Add password to user account
#=============================================
#echo ${PASSWORD} | passwd --stdin ${USER_NAME}
#=============================================  

# This works fine if you are on CentOS and RHEL. Debian-based distro
# considered --stdin a security risk some time back so they don't include it, so on those platforms the chpasswd is
# the way to go.

# As it is, --stdin isn't a security risk if the shell has a built-in echo command, which recent versions of bash do.
# Otherwise that chpasswd approach would be a risk too (because if echo isn't a built-in, it could appear in the process list with the password in cleartext)
# It is true, however, that the most compatible way to do it in a script would be to use chpasswd. That way you won't have
# to worry about whether the script is being run on Ubuntu or CentOS - chpasswd works on both 

# Add password to user account
# Alternative method

echo "${USER_NAME}:${PASSWORD}" | echo chpasswd


# Check if password was successfully added to the account
if [ "${?}" -ne 0 ]
then
    echo "The password for the account could not be set"
    exit 1
fi

# Force password change on first login
#passwd -e "${USER_NAME}" # This also didn't work for Debian
# Changing to 

chage -d 0 "${USER_NAME}"

# Display username, password and the host where the user was created

echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"

exit 0

