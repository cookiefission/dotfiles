#!/bin/zsh

spec_or_test() {
    if [ -d "test" ]; then
        echo "test"
    else
        echo "spec"
    fi
}

_completion() {
    [ -d "app/$1" ] || return

    compadd `find app/$1 -name \*$2 | sed "s/app\/$1\/\|$2$//g"`
}

rmodel() {
    local model="$1"
    if [[ -z "$model" ]]; then
        echo "No model name provided"
        return 1
    fi
    vim -O app/models/$model.rb $(spec_or_test)/models/${model}_spec.rb
}

_rmodel() {
    _completion models "\.rb"
}

compdef _rmodel rmodel

rcont() {
    local controller="$1"
    if [[ -z "$controller" ]]; then
        echo "No controller name provided"
        return 1
    fi
    local controller="${controller}_controller"
    vim -O app/controllers/$controller.rb $(spec_or_test)/controllers/${controller}_spec.rb
}

_rcont() {
    _completion controllers "_controller\.rb"
}

compdef _rcont rcont

rview() {
    local view="$1"
    if [[ -z "$view" ]]; then
        echo "No view name provided"
        return 1
    fi
    vim app/views/$view.html.erb
}

_rview() {
    _completion views "\.html\.erb"
}

compdef _rview rview
