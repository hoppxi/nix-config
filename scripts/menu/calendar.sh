#!/usr/bin/env bash

now="$(date '+%A, %d %B %Y • %H:%M:%S')"
today=$(date +%-d)

# Wrap only the current day number in cal output with a color span
formatted_cal=$(cal | sed "s/\b$today\b/<span foreground='#FF0000'>$today<\/span>/")

echo -e "$formatted_cal" | rofi \
    -dmenu \
    -p "Calendar" \
    -no-custom \
    -markup-rows \
    -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 400px; height: 300px;}' \
    -theme-str 'inputbar {enabled: false;}' \
    -mesg "$now"
