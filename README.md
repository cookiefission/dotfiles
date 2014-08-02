dotfiles
========

My Dotfiles.

![You're gonna have a bad time](http://i.imgur.com/T4xU6RO.jpg)

## Setup

### Misc

- Using Terminator, go to Preferences > Profiles > Command and tick Run command as login shell. Otherwise .bash_profile won't take affect

### Global gitignore

`(cd ~ && ln -s /path/to/dotfiles/.gitignore.global .gitignore.global)`

### Fzf

This shit is awesome and required for some scripts: https://github.com/junegunn/fzf

## Prompt

### Git Status Mapping

Status    | Symbol
----------|-------
Changed   |   ±
Staged    |   ◆
Untracked |   ‥
Unmerged  |   ✗
Clean     |   ✓

N.B append CONFLICTS with red background to any prompt with Unmerged count
