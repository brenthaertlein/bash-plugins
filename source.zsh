#!/bin/bash

export BASH_PLUGINS=$(dirname $(readlink $0))
for sh in $BASH_PLUGINS/*.sh; do 
  local file=$sh 
  source $file
done;
