#!/bin/zsh

rmodel() {
    local model="$1"
    if [[ -z "$model" ]]; then
        echo "No model name provided"
        return 1
    fi
    vim -O app/models/$model.rb spec/models/${model}_spec.rb
}
