#! /bin/bash

function backup () {
    local src=$1
    local dest=$2
    if [ -f $src ]
    then
        backup_file="${dest}/$(basename ${src}).$(date +%F)"
        echo "Backing up ${src} to ${backup_file}"
        cp $src $backup_file
    fi
}

backup /home/sumit/projects/linux-helpers/script.sh /home/sumit/projects
if [ $? -eq 0 ]
then
    echo "Backup succeeded"
fi