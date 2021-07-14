#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
run redshift -l 39.7683333:-86.1580556
run compton -bc
run cbatticon
run nextcloud
