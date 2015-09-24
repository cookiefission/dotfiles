#!/bin/zsh

function rvm_prompt_info() {
    [ -f $HOME/.rvm/bin/rvm-prompt  ] || return 1
    local rvm_prompt
    rvm_prompt=$($HOME/.rvm/bin/rvm-prompt 2>/dev/null)
    [[ "${rvm_prompt}x" == "x"  ]] && return 1
    echo "%F{1}${rvm_prompt}%f | "
}
