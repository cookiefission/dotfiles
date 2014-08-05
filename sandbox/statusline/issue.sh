#!/bin/bash

IFS=$'\n'
touch a
status_arr=( $(git status --porcelain -b) )
for (( i=0; i<${#status_arr[@]}; i++ )); do
    echo ${status_arr[$i]}
    echo ${status_arr[$i]:0:2}
done
