HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify auto_cd prompt_subst
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/sean/.zshrc'

autoload -Uz compinit
compinit

if [ -d $HOME/.zsh ]; then
    source $HOME/.zsh/gitprompt.sh
    PROMPT='%F{5}[%F{2}%T%F{5}] %F{7}%2~ %f%# '
fi
if [ -e $HOME/.shell_aliases ]; then
    source $HOME/.shell_aliases
fi
if [ -e $HOME/.shell_functions ]; then
    source $HOME/.shell_functions
fi

source $HOME/.fzf.zsh
