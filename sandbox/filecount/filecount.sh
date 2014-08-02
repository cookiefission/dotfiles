#!/bin/bash

GIT_STATUS_STAGED=0
GIT_STATUS_ADDED=0
GIT_STATUS_MODIFIED=0
GIT_STATUS_REMOVED=0
GIT_STATUS_UNTRACKED=0

_parse_change() {
    arg_changes=$@

    changes=${arg_changes// /_}

    case $changes in

    esac
}

IFS=$'\n'
status_arr=( $(git status --porcelain -b) )

unset status_arr[0]

for (( i=1; i<=${#status_arr[@]}; i++ )); do
    _parse_change ${status_arr[$i]:0:2}
done

unset IFS
