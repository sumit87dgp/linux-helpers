#!/bin/bash
# This is dummy file for showing examples of re-directions and stuffs
basedir=$(dirname "$0")
echo "Directory - ${basedir}"

head -n5 /etc/passwd >> ${basedir}/res.out 2>&1

# Redirect STDERR to a file using FD 2
ERR_FILE="/tmp/data.err"
head -n5 /etc/passwd /fakefile 2> ${ERR_FILE}

