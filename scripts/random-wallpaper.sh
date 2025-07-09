#!/usr/bin/env bash

# There are only two pictures now; add you own.
MON="DP-1"
FILES=(~/.local/share/hyprpaper/wallpapers/*)
FILE="${FILES[RANDOM % ${#FILES[@]}]}"
hyprctl hyprpaper preload "$FILE"
hyprctl hyprpaper wallpaper "$MON,$FILE"
hyprctl hyprpaper unload unused
