#!/usr/bin/env bash

usage() {
  echo "Usage: $0 --toggle | --is-on"
  exit 1
}

toggle_airplane_mode() {
  if rfkill list all | grep -q -i 'Soft blocked: yes'; then
    rfkill unblock all
  else
    rfkill block all
  fi
}

is_airplane_mode_on() {
  if rfkill list all | grep -q -i 'Soft blocked: yes'; then
    echo true
  else
    echo false
  fi
}

if [ $# -ne 1 ]; then
  usage
fi

case "$1" in
  --toggle)
    toggle_airplane_mode
    ;;
  --is-on)
    is_airplane_mode_on
    ;;
  *)
    usage
    ;;
esac
