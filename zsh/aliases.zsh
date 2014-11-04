alias reload!='. ~/.zshrc && echo "Zshrc Reloaded"'
alias -g ...='../../..'
alias -g groot='"$(git rev-parse --show-toplevel)"'
alias changes='git status --porcelain | cut -c 4- | grep -v lock'
alias unstagedchanges='git diff --name-only | grep -v lock'
alias lastchanges='git diff-tree --no-commit-id --name-only -r HEAD | grep -v lock'
alias openchanges='(cd groot && vim $(changes))'
alias openunstagedchanges='(cd groot && vim $(unstagedchanges))'
alias openlast='(cd groot && vim $(lastchanges))'
alias repo='basename groot'

# Ignore in history
alias fg=' fg'
alias bg=' bg'
alias clear=' clear'

alias -g JSON='| python -m json.tool'
