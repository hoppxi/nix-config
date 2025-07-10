#!/usr/bin/env bash

cliphist list | \
rofi -dmenu \
    -p "Clipboard history" \
    -mesg "Select an entry to copy" \
    -theme-str "window { width: 400px; }" | \
cliphist decode | \
wl-copy
