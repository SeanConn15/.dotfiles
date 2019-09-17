#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
run redshift -l 39.7683333:-86.1580556
run compton -bc
run pa-applet
run dropbox
run sudo ip link set enp7s0 up
