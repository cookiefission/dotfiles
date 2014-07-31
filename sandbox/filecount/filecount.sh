#!/bin/bash

_parse_change() {
    changes=$1
    file=$2

    echo ${changes:0:1}
}

IFS=$'\n'
status_arr=( $(git status --porcelain -b) )
unset IFS

branchline=${status_arr[0]}
unset status_arr[0]

change_count=${#status_arr[@]}

for (( i=1; i<=$change_count; i++ )); do
    _parse_change ${status_arr[$i]}
done
