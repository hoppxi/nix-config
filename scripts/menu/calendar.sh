#!/usr/bin/env bash

now="$(date '+%A, %d %B %Y • %H:%M:%S')"

cal | rofi \
    -dmenu \
    -p "Calendar" \
    -no-custom \
    -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 400px; height: 300px;}' \
    -theme-str 'inputbar {enabled: false;}' \
    -mesg "$now"
