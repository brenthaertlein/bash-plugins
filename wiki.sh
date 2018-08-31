#!/bin/bash

fn_wikir() {
  lynx --dump https://en.wikipedia.org/wiki/Special:Random | sed -n '{3p}'
}

alias wikir=fn_wikir
