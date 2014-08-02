#!/bin/bash

GIT_STATUS_STAGED=0
GIT_STATUS_ADDED=0
GIT_STATUS_MODIFIED=0
GIT_STATUS_REMOVED=0
GIT_STATUS_UNTRACKED=0
GIT_STATUS_UNMERGED=0

##
# Expects a XY combination of changes from git status --porcelain
# See README.md for possible combinations and their meanings
##
_parse_change() {
    case ${@// /_} in
        DD|AU|UD|UA|DU|AA|UU) ((GIT_STATUS_UNMERGED++)) ;;
        "") ((GIT_STATUS_++)) ;;
        "??") ((GIT_STATUS_UNTRACKED++)) ;;
        *) echo Something else ;;
    esac
}

IFS=$'\n'
status_arr=( $(git status --porcelain -b) )

unset status_arr[0]

count=${#status_arr[@]}

for (( i=1; i<=$count; i++ )); do
    _parse_change ${status_arr[$i]:0:2}
done

echo $GIT_STATUS_STAGED
echo $GIT_STATUS_ADDED
echo $GIT_STATUS_MODIFIED
echo $GIT_STATUS_REMOVED
echo $GIT_STATUS_UNTRACKED
echo $GIT_STATUS_UNMERGED

unset IFS
