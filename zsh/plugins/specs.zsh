#!/bin/zsh

specs() {
    if [ -d spec ]; then
        if [ -f "$PWD/Gemfile" ]; then
            bundle exec rspec
        else
            rspec
        fi
    else
        echo "No specs directory found"
        return 1
    fi
}
