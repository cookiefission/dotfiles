
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/sean/.zshrc'

autoload -Uz compinit
compinit

if [ -d ~/.zsh ]; then
    source $HOME/.zsh/prompt
fi
if [ -e ~/.shell_aliases ]; then
    source ~/.shell_aliases
fi
if [ -e ~/.shell_functions ]; then
    source ~/.shell_functions
fi

source ~/.fzf.zsh
