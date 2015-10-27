#!/bin/zsh

# The duplication of `vim "$PWD/.notes.md"` is intentional.
# If .notes.md exists in the current dir, I probably put it
# there for a reason. Otherwise, create/open one at the root
# of the git repo, if applicable. As a last resort, open
# .notes.md in the current dir

function vnote() {
    if [ -f "$PWD/.notes.md" ]; then
        vim "$PWD/.notes.md"
    elif ! [[ "$(git status 2>&1)" =~ Not\ a\ git\ repo ]]; then
        vim "$(git rev-parse --show-toplevel)/.notes.md"
    else
        vim "$PWD/.notes.md"
    fi
}
