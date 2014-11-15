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

export EDITOR=vim

[ -d $HOME/.zsh             ] &&source $HOME/.zsh/*.zsh
[ -e $HOME/.shell_aliases   ] && source $HOME/.shell_aliases
[ -e $HOME/.shell_functions ] && source $HOME/.shell_functions
[ -e $HOME/.zshrc.local     ] && source $HOME/.zshrc.local
