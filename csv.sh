#!/bin/bash

fn_csv() {
  sed 's/,,/ , ,/g;s/,,/, ,/g' $1 | column -s, -t | less -#2 -N -S
}

alias csv=fn_csv $1
