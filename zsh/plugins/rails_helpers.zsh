#!/bin/zsh

spec_or_test() {
    if [ -d "spec" ]; then
        echo "spec"
    else
        echo "test"
    fi
}

_completion() {
    [ -d "app/$1" ] || return

    local state

    _arguments \
        '1: :->name'\
        '*: :->other'

    case $state in
        name) compadd `find app/$1 -name \*$2 | sed "s/app\/$1\/\|$2$//g"` ;;
        *) return
    esac
}

rmodel() {
    local model="$1"
    if [[ -z "$model" ]]; then
        echo "No model name provided"
        return 1
    fi

    local test_file="$(spec_or_test)/models/${model}_$(spec_or_test).rb"
    [ -f $test_file ] || test_file=''

    vim -O app/models/$model.rb $test_file
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

    local test_file="$(spec_or_test)/controllers/${controller}_$(spec_or_test).rb"
    [ -f $test_file ] || test_file=''
    vim -O app/controllers/$controller.rb $test_file
}

_rcont() {
    _completion controllers "_controller\.rb"
}

compdef _rcont rcont

rservice() {
    local service="$1"
    if [[ -z "$service" ]]; then
        echo "No service name provided"
        return 1
    fi

    local test_file="$(spec_or_test)/services/${service}_$(spec_or_test).rb"
    [ -f $test_file ] || test_file=''

    vim -O app/services/$service.rb $test_file
}

_rservice() {
    _completion services "\.rb"
}

compdef _rservice rservice

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

rlib() {
    local lib_file="$1"
    if [[ -z "$lib_file" ]]; then
        echo "No lib file name provided"
        return 1
    fi

    local test_file="$(spec_or_test)/lib/${lib_file}_$(spec_or_test).rb"
    [ -f $test_file ] || test_file=''

    vim -O lib/$lib_file.rb $test_file
}

_rlib() {
    [ -d "lib" ] || return

    local state

    _arguments \
        '1: :->name'\
        '*: :->other'

    case $state in
        name) compadd `find lib -name \*\.rb | sed "s/lib\/\|\.rb$//g"` ;;
        *) return
    esac
}

compdef _rlib rlib
