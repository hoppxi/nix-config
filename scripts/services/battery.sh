#!/usr/bin/env bash

mkdir -p "$HOME/.cache"
STATE_FILE="$HOME/.cache/battery_notify_state.json"

BATTERY=$(upower -e | grep BAT | head -n1)
STATUS=$(upower -i "$BATTERY" | awk '/state:/ { print $2 }')
PERCENT=$(upower -i "$BATTERY" | awk '/percentage:/ { gsub("%", ""); print $2 }')

declare -A LAST
if [[ -f "$STATE_FILE" ]]; then
  while IFS="=" read -r key value; do
    LAST["$key"]="$value"
  done < "$STATE_FILE"
fi

update_state() {
  LAST["$1"]="$2"
}

save_state() {
  : > "$STATE_FILE"
  for key in "${!LAST[@]}"; do
    echo "$key=${LAST[$key]}" >> "$STATE_FILE"
  done
}

send_notification() {
  local msg=$1
  local urgency=${2:-normal}
  notify-send -u "$urgency" "Battery Status" "$msg"
}

if [[ "$STATUS" == "discharging" ]]; then
  if [[ "$PERCENT" -le 5 && "${LAST[5]}" != "yes" ]]; then
    send_notification "Battery critically low (5%)! Plug in now!" critical
    update_state 5 "yes"
  elif [[ "$PERCENT" -le 10 && "${LAST[10]}" != "yes" ]]; then
    send_notification "Battery low (10%)" critical
    update_state 10 "yes"
  elif [[ "$PERCENT" -le 15 && "${LAST[15]}" != "yes" ]]; then
    send_notification "Battery getting low (15%)" normal
    update_state 15 "yes"
  elif [[ "$PERCENT" -le 20 && "${LAST[20]}" != "yes" ]]; then
    send_notification "Battery at 20%" low
    update_state 20 "yes"
  fi

  update_state 100 "no"

else 
  if [[ "$PERCENT" -ge 100 && "${LAST[100]}" != "yes" ]]; then
    send_notification "Battery fully charged! (100%)" low
    update_state 100 "yes"
  fi

  for lvl in 5 10 15 20; do
    update_state "$lvl" "no"
  done
fi

save_state
