#!/usr/bin/env bash

backlight_dir=$(ls -d /sys/class/backlight/* 2>/dev/null | head -n 1)

if [ -z "$backlight_dir" ]; then
  echo "No backlight device found"
  exit 1
fi

if [ "$1" = "--level" ]; then
  brightness=$(cat "$backlight_dir/brightness")
  max_brightness=$(cat "$backlight_dir/max_brightness")
  level=$(( brightness * 100 / max_brightness ))
  echo "$level"
else
  if [ "$1" = "--set" ]; then
    if [ -z "$2" ]; then
      echo "Please provide a brightness level (0–100)"
      exit 1
    fi

    input_level="$2"

    # Clamp between 0 and 100
    if [ "$input_level" -lt 0 ]; then
      input_level=0
    fi

    if [ "$input_level" -gt 100 ]; then
      input_level=100
    fi

    max_brightness=$(cat "$backlight_dir/max_brightness")
    new_brightness=$(( input_level * max_brightness / 100 ))

    echo "$new_brightness" > "$backlight_dir/brightness"
  else
    echo "Usage:"
    echo "  $0 --level         # Get backlight brightness (0–100)"
    echo "  $0 --set <number>  # Set brightness to <number> percent"
    exit 1
  fi
fi

