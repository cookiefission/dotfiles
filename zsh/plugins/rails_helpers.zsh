#!/bin/zsh

_completion() {
    [ -d "app/$1" ] || return

    compadd `find app/$1 -name \*.rb | sed "s/app\/$1\/\|\.rb$//g"`
}

rmodel() {
    local model="$1"
    if [[ -z "$model" ]]; then
        echo "No model name provided"
        return 1
    fi
    vim -O app/models/$model.rb spec/models/${model}_spec.rb
}

_rmodel() {
    _completion models
}

compdef _rmodel rmodel

rctrl() {
    local controller="$1"
    if [[ -z "$controller" ]]; then
        echo "No controller name provided"
        return 1
    fi
    local controller="${controller}_controller"
    vim -O app/controllers/$controller.rb spec/controllers/${controller}_spec.rb
}

_rctrl() {
    _completion controllers
}

compdef _rctrl rctrl

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
