#!/bin/zsh

cukes() {
    if [ -f "$PWD/Gemfile" ]; then
        bundle exec cucumber
    elif [ -f "$PWD/Rakefile" ]; then
        rake cucumber
    else
        echo "No Gemfile or Rakefile found"
        cucumber
    fi
}
