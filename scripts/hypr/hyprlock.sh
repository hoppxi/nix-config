#!/usr/bin/env bash

# Currently playing music and fallback

USER_NAME="${USER:-$(whoami)}"
HOST_NAME="$(hostname)"
SESSION="${XDG_SESSION_DESKTOP:-${DESKTOP_SESSION:-hyprland}}"

get_playerctl_metadata() {
  local key=$1
  playerctl metadata "$key" 2>/dev/null
}

safe_metadata() {
  local value
  value="$(get_playerctl_metadata "$1")"
  if [[ -z "$value" || "$value" == "No players found" ]]; then
    echo ""
  else
    echo "$value"
  fi
}

truncate_ellipses() {
  local maxlen=18
  local str="$1"
  if (( ${#str} > maxlen )); then
    echo "${str:0:maxlen-3}..."
  else
    echo "$str"
  fi
}

for arg in "$@"; do
  case "$arg" in
    --title)
      title=$(safe_metadata title)
      echo "$(truncate_ellipses "${title:-$USER_NAME}")"
      ;;
    --artist)
      artist=$(safe_metadata artist)
      echo "$(truncate_ellipses "${artist:-$USER_NAME@$HOST_NAME}")"
      ;;
    --album)
      album=$(safe_metadata album)
      echo "$(truncate_ellipses "${album:-$SESSION}")"
      ;;
    *)
      echo "Usage: $0 [--title] [--artist] [--album]"
      exit 1
      ;;
  esac
done
