#!/usr/bin/env bash

mkdir -p "$HOME/.cache"
STATE_FILE="$HOME/.cache/network_notify_state.json"

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
  local icon=$3
  notify-send -i "$icon" -u "$urgency" "Network Status" "$msg"
}

CONNECTED=$(nmcli -t -f STATE general)
WIFI_SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
WIFI_SIGNAL=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^\*' | cut -d: -f2)

ETH_DEV=$(nmcli device status | grep ethernet | awk '{print $1}')
ETH_STATE=$(nmcli device status | grep ethernet | awk '{print $3}')

if [[ -n "$WIFI_SSID" && "${LAST[wifi-ssid]}" != "$WIFI_SSID" ]]; then
  send_notification "Connected to Wi-Fi: $WIFI_SSID" normal ~/.nix-profile/share/icons/Papirus-Dark/16x16/panel/network-wireless-connected.svg
  update_state "wifi-ssid" "$WIFI_SSID"
fi

if [[ -n "$WIFI_SIGNAL" && "$WIFI_SIGNAL" -lt 30 && "${LAST[wifi-low-signal]}" != "yes" ]]; then
  send_notification "Weak Wi-Fi signal ($WIFI_SIGNAL%) on $WIFI_SSID" low ~/.nix-profile/share/icons/Papirus-Dark/16x16/panel/network-wireless-signal-weak.svg
  update_state "wifi-low-signal" "yes"
elif [[ -n "$WIFI_SIGNAL" && "$WIFI_SIGNAL" -ge 30 && "${LAST[wifi-low-signal]}" != "no" ]]; then
  # Clear low signal state when signal is back
  update_state "wifi-low-signal" "no"
fi

if [[ "$CONNECTED" == "disconnected" && "${LAST[wifi-ssid]}" != "disconnected" ]]; then
  send_notification "Wi-Fi disconnected!" critical ~/.nix-profile/share/icons/Papirus-Dark/16x16/panel/network-wireless-diconnected-.svg
  update_state "wifi-ssid" "disconnected"
fi

# Ethernet Notifications
if [[ "$ETH_STATE" == "connected" && "${LAST[ethernet]}" != "connected" ]]; then
  send_notification "Ethernet connected on $ETH_DEV" normal
  update_state "ethernet" "connected" ~/.nix-profile/share/icons/Papirus-Dark/16x16/panel/network-wired-activated.svg
elif [[ "$ETH_STATE" != "connected" && "${LAST[ethernet]}" == "connected" ]]; then
  send_notification "Ethernet disconnected from $ETH_DEV" critical
  update_state "ethernet" "disconnected" ~/.nix-profile/share/icons/Papirus-Dark/16x16/panel/network-wired-disconnected.svg
fi

save_state
