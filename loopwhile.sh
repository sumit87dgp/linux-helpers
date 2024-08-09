#! /bin/bash
# Demonstrating while loop

# Simple while loop, using read and grep
LINE_NUM=1
while read LINE
do
    echo "${LINE_NUM}: ${LINE}"
    ((LINE_NUM++))
done < /etc/passwd

echo "Now reading contents"

grep sys /etc/passwd | while read LINE
do
    echo "sys: ${LINE}"
done

# Simple while loop asking user about number of lines to be displayed

read -p "How many lines of /etc/passwd would you like to see? " no_of_lines

LOOP_LINE=1
while read LINE
do
    echo "${LINE}"
    ((LOOP_LINE++))
    if [ $LOOP_LINE -gt $no_of_lines ]
    then
        break;
    else
        continue;
    fi
done < /etc/passwd
    
