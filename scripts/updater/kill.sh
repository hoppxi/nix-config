#!/usr/bin/env bash

PID_FILE="/tmp/nix-updater.pid"

if [[ -f "$PID_FILE" ]]; then
  PID=$(cat "$PID_FILE")
  PGID=$(ps -o pgid= -p "$PID" | tr -d ' ')
  if [[ -n "$PGID" ]]; then
    kill -TERM -"$PGID"
    notify-send "Nix Updater" "Updater process group $PGID has been terminated."
    echo "Killed process group $PGID."
  else
    notify-send "Nix Updater" "Failed to find process group for PID $PID."
    echo "Could not find process group for PID $PID."
  fi
else
  notify-send "Nix Updater" "No updater PID file found."
  echo "No PID file found at $PID_FILE."
fi
