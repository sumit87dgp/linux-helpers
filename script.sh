#! /bin/bash

#sleep 90
echo "Scripting is fun"
echo "shebang is actually sharp(#) bang(!)"

echo "DEMO VARIABLE"

MY_NAME="Sumit"

echo "${MY_NAME} is a good boy"

echo "Hello $MY_NAME. How are you"

# Output of commands can be stored in the variable
SERVER_NAME=$(hostname)

echo "You are executing the script on $SERVER_NAME"

# Conditional Statements
if [ -e /etc/passwd ]
then
echo "Print if exists $CHECK_FILE"
fi

# Iteration or for loop

COLORS="red green yellow"

for COLOR in $COLORS
do
    echo "COLOR:$COLOR"
done

# Another form

for animal in tiger lion dear
do
    echo "Animal: $animal"
done

