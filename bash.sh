#!/bin/bash

export HISTCONTROL=ignoreboth
export HISTCONTROL="frequent*:cd -"
export HISTORY_IGNORE="(frequent*|cd -)"

alias ...=../..
alias ....=../../..

fn_freq() {
  local num=${1:-10}
	cat $HISTFILE | sed -E 's/\:\s(.*)\:(.)\;//g' | awk '{print $1}' | sort | uniq -c | sort -nr | head -n $num
  #history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' | sort | uniq -c | sort -nr | head -n $num
}
alias frequent=fn_freq $@

