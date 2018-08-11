#/bin/bash

fn_starwars() {
  local url=towel.blinkenlights.nl
  telnet $url
}

alias starwars=fn_starwars
