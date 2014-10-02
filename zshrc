HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
setopt appendhistory extendedglob notify auto_cd
unsetopt beep
zstyle :compinstall filename '/home/sean/.zshrc'

setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

autoload -Uz compinit
compinit

if [ -d $HOME/.zsh ]; then
    source $HOME/.zsh/prompt
    source $HOME/.zsh/aliases.zsh
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

export EDITOR=vim


source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--reverse +i"
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:$PATH
