HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
setopt appendhistory extendedglob notify auto_cd
unsetopt beep
zstyle :compinstall filename '/home/sean/.zshrc'

autoload -Uz compinit
compinit

if [ -d $HOME/.zsh ]; then
    source $HOME/.zsh/prompt
fi
if [ -e $HOME/.shell_aliases ]; then
    source $HOME/.shell_aliases
fi
if [ -e $HOME/.shell_functions ]; then
    source $HOME/.shell_functions
fi

source $HOME/.fzf.zsh
export FZF_DEFAULT_OPTS="--reverse +i"
