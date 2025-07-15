#!/usr/bin/env bash

# Check if bluetoothctl is available
command -v bluetoothctl &>/dev/null || {
  echo "Error: bluetoothctl not found"
  exit 1
}

# Check if controller is powered
powered=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')
if [[ "$powered" != "yes" ]]; then
  connected="false"
  device_name="disconnected"
else
  # Try to find any connected device
  device_name=$(bluetoothctl devices Connected | sed -E 's/^Device [^ ]+ //')
  if [[ -n "$device_name" ]]; then
    connected="true"
  else
    connected="false"
    device_name="disconnected"
  fi
fi

# Handle CLI options
case "$1" in
  --status)
    echo "$connected"
    ;;
  --device)
    echo "$device_name"
    ;;
  *)
    echo "Usage: $0 --status | --device"
    exit 1
    ;;
esac
