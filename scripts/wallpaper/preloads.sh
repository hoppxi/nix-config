#!/usr/bin/env bash
dir=./assets/images/wallpapers
outputfile="./home/modules/hypr/hyprpaper/preloads.nix"

{
	echo "{ config, ... }:"
	echo "{"
  echo "  preloadList = ["
  find "$dir" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) -printf '  "${config.home.homeDirectory}/.config/backgrounds/%f"\n' | sed 's/^/  /'
  echo "  ];"
	echo "}"
} > "$outputfile"
