#!/bin/bash

IFS=$'\n'
touch ab
status_arr=( $(git status --porcelain -b) )
for (( i=0; i<${#status_arr[@]}; i++ )); do
    echo ${status_arr[$i]}
    # Without quotes, untracked ?? are interpreted by bash as the filename
    # glob operator and the filename ab is expanded to
    echo "${status_arr[$i]:0:2}"
done
