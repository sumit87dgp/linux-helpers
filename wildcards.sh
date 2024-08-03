#! /bin/bash

# [] - A character class
# [a-g]* Ranges
# Named Character Classes
# Globbing operation - Searching using a wild-card in  a list of files and directories.

function rename_file(){
    pattern='*.sh'
    for file in $(ls $pattern)
    do
        echo $file
    done
}

rename_file