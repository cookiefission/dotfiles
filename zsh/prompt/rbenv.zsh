#!/bin/zsh

function rbenv_prompt_info() {
    local rbenv_prompt
    rbenv_prompt=$(rbenv version-name 2>/dev/null)
    [[ "${rbenv_prompt}x" == "x"  ]] && return 1
    echo " | %F{1}${rbenv_prompt}%f"
}
