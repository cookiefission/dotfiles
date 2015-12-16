#!/bin/zsh

cukes() {
    if [ -d "$PWD/features" ]; then
        if [ -f "$PWD/Gemfile" ]; then
            bundle exec cucumber $@
        elif [ -f "$PWD/Rakefile" ]; then
            rake cucumber $@
        else
            echo "No Gemfile or Rakefile found"
            cucumber $@
        fi
    else
        echo "No features directory found"
        return 1
    fi
}
