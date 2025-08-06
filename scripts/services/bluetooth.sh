#!/usr/bin/env bash

mkdir -p "$HOME/.cache"
STATE_FILE="$HOME/.cache/bluetooth_notify_state.json"

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
  notify-send -u "$urgency" "Bluetooth Status" "$msg"
}

# ---- Bluetooth Controller Power Status ----
BT_POWER=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [[ "$BT_POWER" == "yes" && "${LAST[bt-power]}" != "on" ]]; then
  send_notification "Bluetooth turned ON"
  update_state "bt-power" "on"
elif [[ "$BT_POWER" == "no" && "${LAST[bt-power]}" != "off" ]]; then
  send_notification "Bluetooth turned OFF" critical
  update_state "bt-power" "off"
fi

# ---- Paired Device Connection Status ----
while read -r MAC; do
  INFO=$(bluetoothctl info "$MAC")
  NAME=$(echo "$INFO" | grep "Name:" | cut -d ' ' -f2-)
  CONNECTED=$(echo "$INFO" | grep "Connected: yes")

  if [[ -n "$CONNECTED" ]]; then
    # Connected
    if [[ "${LAST[bt-$MAC]}" != "connected" ]]; then
      send_notification "Connected to $NAME ($MAC)"
      update_state "bt-$MAC" "connected"
    fi
  else
    # Disconnected
    if [[ "${LAST[bt-$MAC]}" == "connected" ]]; then
      send_notification "Disconnected from $NAME ($MAC)" critical
      update_state "bt-$MAC" "disconnected"
    fi
  fi
done < <(bluetoothctl paired-devices | awk '{print $2}')

save_state
