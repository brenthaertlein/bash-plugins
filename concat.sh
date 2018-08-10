#!/bin/bash

fn_concat() {
  sed '$s/$/\n/g' $@
}

alias concat=fn_concat $@
