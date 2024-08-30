#!/bin/bash
# This is a script for creation of user

# Enforce that it is executed as root
if [[ "${UID}" -ne 0 ]]
then
    echo 'Execute script as root'
    exit 1
fi

if [[ "${#}" -lt 1 ]]
then
    echo "SYNOPSIS"
    echo "Usage: ${0} USER_NAME [COMMENT]..."
    exit 1
fi

USER_NAME="${1}"
shift
COMMENT="${@}" # evry other parameter

PASSWORD=$(date +%s%N | sha256sum | head -c48)

# Create the user with the password
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd comment succeded
if [[ "${?}" -ne 0 ]]
then
    echo 'The account could not be created.'
    exit 1
fi

# Set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check if password change was success
if [[ "${?}" -ne 0 ]]
then
    echo 'The password change was successfull'
fi

