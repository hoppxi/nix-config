#!/usr/bin/env bash

# Get active connection from NetworkManager via nmcli
active_conn=$(nmcli -t -f DEVICE,TYPE,STATE dev | grep ":connected" | head -n 1)
device=$(echo "$active_conn" | cut -d: -f1)
type=$(echo "$active_conn" | cut -d: -f2)
state=$(echo "$active_conn" | cut -d: -f3)

# Get name of the active connection (SSID or profile name)
conn_name=$(nmcli -t -f NAME,DEVICE connection show --active | grep "$device" | cut -d: -f1)

## Status
get_status() {
	if [[ -n "$device" && "$state" == "connected" ]]; then
		echo "Connected to $conn_name"
	else
		echo "Not connected"
	fi
}

get_status_bool() {
    if [[ -n "$device" && "$state" == "connected" ]]; then
		echo true
	else
		echo false
	fi
}

## Connection name
get_connection() {
	if [[ -n "$conn_name" ]]; then
		echo "$conn_name"
	else
		echo "Not avaliable"
	fi
}

## Connection type
get_type() {
	if [[ -n "$type" ]]; then
		echo "$type"
	else
		echo "Unknown"
	fi
}

## Handle args
case "$1" in
	--status)
		get_status
		;;
	--connection)
		get_connection
		;;
	--type)
		get_type
		;;
    --status-bool)
        get_status_bool
        ;;
	*)
		echo "Usage: $0 [--status | --connection | --type | --status-bool]"
		exit 1
		;;
esac
