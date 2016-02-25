#!/bin/zsh

# Split output on newlines
IFS=$'\n'

# Prompt Variables
GIT_STATUS_STAGED=0
GIT_STATUS_UNSTAGED=0
GIT_STATUS_UNTRACKED=0
GIT_STATUS_UNMERGED=0

# Prompt Symbols
GIT_STATUS_STAGED_SYMBOL='●'
GIT_STATUS_UNSTAGED_SYMBOL='±'
GIT_STATUS_UNTRACKED_SYMBOL='‥'
GIT_STATUS_UNMERGED_SYMBOL='✗'
GIT_REPO_CLEAN_SYMBOL='✓'

# Prompt Colours
GIT_STATUS_STAGED_COLOUR=39
GIT_STATUS_UNSTAGED_COLOUR=213
GIT_STATUS_UNTRACKED_COLOUR=226
GIT_STATUS_UNMERGED_COLOUR=196
GIT_REPO_CLEAN_COLOUR=2
GIT_REPO_CLEAN_LINE="%F{$GIT_REPO_CLEAN_COLOUR}$GIT_REPO_CLEAN_SYMBOL"
BRANCH_COLOUR=$GIT_REPO_CLEAN_COLOUR

##
# Expects a XY combination of changes from git status --porcelain
# See README.md for possible combinations and their meanings
##
function _parse_change() {
    local changes=${@// /_}
    case $changes in
        DD|AU|UD|UA|DU|AA|UU)
            ((GIT_STATUS_UNMERGED++))
            ;;
        "??")
            ((GIT_STATUS_UNTRACKED++))
            ;;
        *)
            [[ ${changes:0:1} == _ ]] || ((GIT_STATUS_STAGED++))
            [[ ${changes:1:2} == _ ]] || ((GIT_STATUS_UNSTAGED++))
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
function _parse_branch() {
    local branchline=${1:3}
    if [[ "$branchline" == "HEAD (no branch)" ]]; then
        echo "(`git rev-parse --short HEAD`)"
    else
        echo ${branchline%%...*}
    fi
}

# Prompt
function git_prompt() {
    local IFS=$'\n'
    status_arr=( `git status --porcelain -b 2>&1` )
    if [ $? -eq 0 ]; then
        unset IFS
        local branch="`_parse_branch ${status_arr[1]} 2>&1`"
        local IFS=$'\n'
        local count=${#status_arr[@]}
        for (( i=2; i<=$count; i++ )); do
            _parse_change "${status_arr[$i]:0:2}"
        done
        GIT_REPO_CLEAN=0
        if [ $GIT_STATUS_UNTRACKED -gt 0 ]; then
            BRANCH_COLOUR=$GIT_STATUS_UNTRACKED_COLOUR
            untracked="%F{$GIT_STATUS_UNTRACKED_COLOUR}$GIT_STATUS_UNTRACKED$GIT_STATUS_UNTRACKED_SYMBOL"
            GIT_REPO_CLEAN=1
        fi
        if [ $GIT_STATUS_STAGED    -gt 0 ]; then
            BRANCH_COLOUR=$GIT_STATUS_STAGED_COLOUR
            staged="%F{$GIT_STATUS_STAGED_COLOUR}$GIT_STATUS_STAGED$GIT_STATUS_STAGED_SYMBOL"
            GIT_REPO_CLEAN=1
        fi
        if [ $GIT_STATUS_UNSTAGED  -gt 0 ]; then
            BRANCH_COLOUR=$GIT_STATUS_UNSTAGED_COLOUR
            unstaged="%F{$GIT_STATUS_UNSTAGED_COLOUR}$GIT_STATUS_UNSTAGED$GIT_STATUS_UNSTAGED_SYMBOL"
            GIT_REPO_CLEAN=1
        fi
        if [ $GIT_STATUS_UNMERGED  -gt 0 ]; then
            BRANCH_COLOUR=$GIT_STATUS_UNMERGED_COLOUR
            unmerged="%F{$GIT_STATUS_UNMERGED_COLOUR}$GIT_STATUS_UNMERGED$GIT_STATUS_UNMERGED_SYMBOL"
            GIT_REPO_CLEAN=1
        fi
        GIT_PROMPTLINE=" %F{$BRANCH_COLOUR}$branch%f|"
        GIT_PROMPTLINE+=$staged
        GIT_PROMPTLINE+=$unstaged
        GIT_PROMPTLINE+=$untracked
        GIT_PROMPTLINE+=$unmerged
        [ $GIT_REPO_CLEAN -eq 0 ] && GIT_PROMPTLINE+=$GIT_REPO_CLEAN_LINE
        echo $GIT_PROMPTLINE
    fi
}
unset IFS
