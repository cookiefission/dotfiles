#!/bin/zsh

asin () {
    local asin="$1"
    local tld="${2:-co.uk}"
    open "http://www.amazon.$tld/gp/product/$asin"
}
