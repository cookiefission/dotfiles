#!/bin/bash

GIT_STATUS_STAGED=0
GIT_STATUS_UNSTAGED=0
GIT_STATUS_UNTRACKED=0
GIT_STATUS_UNMERGED=0

##
# Expects a XY combination of changes from git status --porcelain
# See README.md for possible combinations and their meanings
##
_parse_change() {
    changes=${@// /_}
    case $changes in
        DD|AU|UD|UA|DU|AA|UU)
            ((GIT_STATUS_UNMERGED++))
            ;;
        "??")
            ((GIT_STATUS_UNTRACKED++))
            ;;
        *)
            [ ${changes:0:1} == _ ] || ((GIT_STATUS_STAGED++))
            [ ${changes:1:2} == _ ] || ((GIT_STATUS_UNSTAGED++))
            ;;
    esac
}

IFS=$'\n'
status_arr=( $(git status --porcelain -b) )

unset status_arr[0]

count=${#status_arr[@]}

for (( i=1; i<=$count; i++ )); do
    _parse_change ${status_arr[$i]:0:2}
done

echo -ne "Staged:\t\t"
echo $GIT_STATUS_STAGED

echo -ne "Unstaged:\t"
echo $GIT_STATUS_UNSTAGED

echo -ne "Untracked:\t"
echo $GIT_STATUS_UNTRACKED

echo -ne "Unmerged:\t"
echo $GIT_STATUS_UNMERGED

unset IFS
