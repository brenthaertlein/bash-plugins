#!/bin/bash

for sh in $BASH_PLUGINS/*.sh; do 
  local file=$sh 
  source $file
done;
