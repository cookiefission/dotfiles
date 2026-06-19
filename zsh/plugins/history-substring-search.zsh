if [ -d $HOME/.zsh-history-substring-search ]; then
    source ~/.zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey -M emacs '^P' history-substring-search-up
    bindkey -M emacs '^N' history-substring-search-down

    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi

if [ -d /usr/local/share/zsh-history-substring-search/ ]; then
    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey -m emacs '^p' history-substring-search-up
    bindkey -m emacs '^n' history-substring-search-down

    bindkey -m vicmd 'k' history-substring-search-up
    bindkey -m vicmd 'j' history-substring-search-down
fi

if [ -d /opt/homebrew/share/zsh-history-substring-search/ ]; then
    source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    bindkey -m emacs '^p' history-substring-search-up
    bindkey -m emacs '^n' history-substring-search-down

    bindkey -m vicmd 'k' history-substring-search-up
    bindkey -m vicmd 'j' history-substring-search-down
fi
