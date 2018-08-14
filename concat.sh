#!/bin/bash

fn_concat() {
  sed '$s/$/\n/g' -s $@
}

alias concat=fn_concat $@
