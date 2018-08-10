#!/bin/bash

fn_chrome() {
  open -na "Google Chrome" --args --new-window "$@"
}

fn_google() {
  local search=
  for arg in $@; do
    local term=$(echo $arg | sed -E 's/(.*)\s(.*)/"\0"/g')
    if [[ -z $search ]] then search=$term; else search=$search+$term; fi
  done
  fn_chrome "https://www.google.com/search?q=$search"
}

alias chrome=fn_chrome $@
alias google=fn_google $@
