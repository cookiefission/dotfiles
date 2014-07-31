#!/bin/bash

##
# Expects the first line from "git status --porcelain -b"
#   Like:
#       ## master...origin/master
#   or:
#       ## HEAD (no branch)
##
_parse_branch() {
    branchline=$2
    if [[ "$branchline" == HEAD ]]; then
        echo "(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
            echo HEAD`)"
    else
        echo ${branchline%%...*}
    fi
}

IFS=$'\n'
status_arr=( $(git status --porcelain -b) )
unset IFS

branch="`_parse_branch ${status_arr[0]} 2>&1`"

echo "Current branch, from git status --porcelain -b is: " $branch
