#!/bin/bash

IFS=$'\n'
status_arr=($(git status --porcelain -b))
unset IFS

echo ${status_arr[0]}
echo ${status_arr[1]}
echo ${#status_arr[@]}
