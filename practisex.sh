#! /bin/bash

# Exercise 1
echo "Shell scripting is fun"


# Exercise 2 (Variables)
MESSAGE="Shell scripting is fun"
echo "$MESSAGE"

# Exericse 3
HOSTNAME=$(hostname)
echo "The script is running on ${HOSTNAME}"

# Exercise 4 (Conditional Statement)
# Shell script to check if file exists
if [ -e /etc/shadow ]
then
    echo "Shadow passwords are enabled"
fi

# Shell script check if file is writable
if [ -w /etc/shadow ]
then
    echo "You have permission to edit /etc/shadow"
else
    echo "You do NOT have permission to edit /etc/shadow"
fi

# Exercise 5 (For loop)
MAMALS='man bear pig dog cat sheep'
for MAMMAL in $MAMALS
do
    echo "$MAMMAL"
done

# Exercise 6 (Input read)

read -p "Enter name of file or directory:" FILEORDIR
if [ -d $FILEORDIR ]
then
    echo "It's a directory"
elif [ -f $FILEORDIR ]
then
    echo "It's a regular file"
fi

lscmdd=$(ls -la $FILEORDIR)
echo "$lscmdd"

# Exercise 7 (Passing argument)

FILENAME=$1
if [ -d $FILENAME ]
then
    echo "It's a directory"
elif [ -f $FILENAME ]
then
    echo "It's a regular file"
fi

lscmde=$(ls -la $FILENAME)
echo "$lscmde"