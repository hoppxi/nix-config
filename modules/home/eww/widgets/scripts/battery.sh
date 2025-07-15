#!/usr/bin/env bash

battery=$(upower -e | grep battery | head -n 1)

if [ -z "$battery" ]; then
  echo "No battery found"
  exit 1
fi

level=$(upower -i "$battery" | grep percentage | awk '{print $2}')
status=$(upower -i "$battery" | grep state | awk '{print $2}')

if [ "$1" = "--level" ]; then
  echo "$level"
else
  if [ "$1" = "--status" ]; then
    echo "$status"
  else
    if [ "$1" = "--charging" ]; then
      if [ "$status" = "charging" ]; then
        echo "true"
      else
        echo "false"
      fi
    else
      echo "Usage: $0 --level | --status | --charging"
      exit 1
    fi
  fi
fi
