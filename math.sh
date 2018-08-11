#!/bin/bash

fn_math() {
  local op=$1
  shift
  case $1 in
    'add'
      fn_add $@
    'sub'
    'subtract'
    'div'
    'divide'
    'mult'
    'multiply'
  esac
}

fn_add() {
  local sum=0
  for arg in $@; do
    sum=$sum+$arg
  done
}

alias math=fn_math $@
