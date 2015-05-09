HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

autoload -Uz compinit
compinit

zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

setopt appendhistory extendedglob notify auto_cd correct menu_complete
unsetopt beep
zstyle :compinstall filename '/home/sean/.zshrc'
zstyle ':completion:*' menu select

setopt HIST_IGNORE_SPACE
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

if [ -d $HOME/.zsh ]; then
    source $HOME/.zsh/prompt.zsh
    source $HOME/.zsh/aliases.zsh
    source $HOME/.zsh/plugins.zsh
    source $HOME/.zsh/completions.zsh
fi

if [ -e $HOME/.shell_aliases ]; then
    source $HOME/.shell_aliases
fi

if [ -e $HOME/.shell_functions ]; then
    source $HOME/.shell_functions
fi

if [ -e $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
