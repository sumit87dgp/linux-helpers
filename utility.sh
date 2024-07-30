#! /bin/bash

function backup () {
    local src=$1
    local dest=$2
    if [ -f $src ]
    then
        backup_file="${dest}/$(basename ${src}).$(date +%F).$$"
        echo "Backing up ${src} to ${backup_file}"
        cp $src $backup_file
    fi
}

# backup /home/sumit/projects/linux-helpers/script.sh /home/sumit/projects
# if [ $? -eq 0 ]
# then
#     echo "Backup succeeded"
# fi

# To be used only to find count of parent file/directory. Non-recursive
function file_count() {
    local dir_path=$1
    # Check if the path the directory
    if [ ! -d $dir_path ]
    then
        echo "Invalid directory path"
        return 1
    else
        echo "Valid dir path"
        local no_of_files=$(ls -A | wc -l)
        echo "Total number of files/directory just 1 level ${no_of_files}"
    fi
    return 0
}

read -p "Enter a valid directory path: " DIRPATH
file_count $DIRPATH 

