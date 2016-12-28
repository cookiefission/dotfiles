noglob-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != noglob\ * ]] && BUFFER="noglob $BUFFER"
    zle end-of-line
}

zle -N noglob-command-line

# Defined shortcut keys: [Esc] n
bindkey "\en" noglob-command-line
