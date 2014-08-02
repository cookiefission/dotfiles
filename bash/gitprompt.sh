#!/bin/bash

# Split output on newlines
IFS=$'\n'

# Prompt Variables
GIT_STATUS_STAGED=0
GIT_STATUS_UNSTAGED=0
GIT_STATUS_UNTRACKED=0
GIT_STATUS_UNMERGED=0

# Prompt Symbols
GIT_STATUS_STAGED_SYMBOL="✓"
GIT_STATUS_UNSTAGED_SYMBOL="±"
GIT_STATUS_UNTRACKED_SYMBOL="‥"
GIT_STATUS_UNMERGED_SYMBOL="✗"
GIT_DIR_CLEAN_SYMBOL="✓"

# Prompt Colours
GIT_STATUS_STAGED_COLOUR=34
GIT_STATUS_UNSTAGED_COLOUR=35
GIT_STATUS_UNTRACKED_COLOUR=33
GIT_STATUS_UNMERGED_COLOUR=41
GIT_DIR_CLEAN_COLOUR=35

##
# Expects a XY combination of changes from git status --porcelain
# See README.md for possible combinations and their meanings
##
_parse_change() {
    local changes=${@// /_}
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

##
# Expects the first line from "git status --porcelain -b"
#   Like:
#       ## master...origin/master
#   or:
#       ## HEAD (no branch)
##
_parse_branch() {
    local branchline=$2
    if [[ "$branchline" == HEAD ]]; then
        echo "(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
            echo HEAD`)"
    else
        echo ${branchline%%...*}
    fi
}

# Prompt
git_prompt() {
    local IFS=$'\n'
    status_arr=( `git status --porcelain -b 2>&1` )
    if ! [[ "${status_arr[@]}" =~ Not\ a\ git\ repo ]]; then
        unset IFS
        local branch="`_parse_branch ${status_arr[0]} 2>&1`"
        local IFS=$'\n'
        local count=${#status_arr[@]}
        for (( i=1; i<$count; i++ )); do
            _parse_change ${status_arr[$i]:0:2}
        done
        local ansi=32
        [ $GIT_STATUS_UNTRACKED -eq 0 ] || local ansi=$GIT_STATUS_UNTRACKED_COLOUR
        [ $GIT_STATUS_STAGED -eq 0 ] || local ansi=$GIT_STATUS_STAGED_COLOUR
        [ $GIT_STATUS_UNSTAGED -eq 0 ] || local ansi=$GIT_STATUS_UNSTAGED_COLOUR
        [ $GIT_STATUS_UNMERGED -eq 0 ] || local ansi=$GIT_STATUS_UNMERGED_COLOUR
        echo -n ' \[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\]'
    fi
}

unset IFS
