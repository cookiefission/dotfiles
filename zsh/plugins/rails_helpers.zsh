#!/bin/zsh

rmodel() {
    local model="$1"
    if [[ -z "$model" ]]; then
        echo "No model name provided"
        return 1
    fi
    vim -O app/models/$model.rb spec/models/${model}_spec.rb
}

rview() {
    local view="$1"
    if [[ -z "$view" ]]; then
        echo "No view name provided"
        return 1
    fi
    vim app/views/$view.html.erb
}

rlayout() {
    local layout="$1"
    if [[ -z "$layout" ]]; then
        layout="application"
    fi
    vim app/views/layouts/$layout.html.erb
}
