#!/bin/bash

fn_lowercase() {
  if [ -p /dev/stdin/ ]; then
    while IFS= read line; do
      echo $line | sed 's/\(.*\)/\L\1/'
    done
  else
    for arg in $@; do
      echo $arg | sed 's/\(.*\)/\L\1/'
    done
  fi
}

alias lowercase=fn_lowercase $@
