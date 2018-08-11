#!/bin/bash

fn_math() {
  local op=$1
  shift
  case $op in
    'add')
      fn_add $@
      ;;
    'sub' | 'subtract')
      fn_sub $@
      ;;
    'div' | 'divide')
      fn_div $@
      ;;
    'mult' | 'multiply')
      fn_mult $@
      ;;
    *)
      echo "$op is not a valid math argument"
    ;;
  esac
}

fn_add() {
  local sum=0
  for arg in $@; do
    sum=$((sum+arg))
  done
  echo $sum
}

fn_sub() {
  local sum=$1
  shift
  for arg in $@; do
    sum=$((sum-arg))
  done
  echo $sum
}

fn_mult() {
  local mult=1
  for arg in $@; do
    mult=$((mult * arg))
  done
  echo $mult
}

fn_div() {
  if [ $# -gt 3 ]; then
    echo 'Divide cannot take more than 3 arguments
      e.g. math divide $dividend $divisor $scale'
    return
  fi
  if [ -z $2 ] || [ $2 -eq 0 ]; then
    echo 'Cannot divide by 0'
    return
  fi
  if [ ! -z $3 ]; then
    echo "Setting scale to $3"
  fi
  local scale=${3:-2}
  local calc="scale=$scale ; $1 / $2"
  local result=$(bc <<< $calc)
  if [ ! -z $3 ]; then
    echo $result
  else
    # should probably learn what happened with sed here
    echo $result | sed '/\./ s/\.\{0,1\}0\{1,\}$//'
  fi
}

alias math=fn_math $@
