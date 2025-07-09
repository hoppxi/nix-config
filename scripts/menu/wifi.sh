#!/usr/bin/env bash

iface=$(nmcli device status | awk '$2 == "wifi" {print $1; exit}')
[ -z "$iface" ] && notify-send "Wi-Fi Error" "No Wi-Fi device found" && exit 1

radio_state=$(nmcli radio wifi)
connected_ssid=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)

if [[ "$radio_state" == "enabled" ]]; then
	disable_label="Disable Wi-Fi"
else
	disable_label="Enable Wi-Fi"
fi

disconnect_label=""
connection_status_label=""
if [ -n "$connected_ssid" ]; then
	disconnect_label="Disconnect Wi-Fi"
	connection_status_label="$connected_ssid"
else
	disconnect_label="Disconnected"
	connection_status_label="None"
fi


### === MAIN MENU ===

option_1="  Wi-Fi List"
option_2="󱛀  Manual Entry"
option_3="󱚼  $disconnect_label"
option_4="󱛅  $disable_label"
option_5="󰩩  Launch nmtui"

main_menu_items="$option_1\n$option_2\n$option_3\n$option_4\n$option_5"

rofi_cmd() {
	rofi -dmenu -i -p 'Wi-Fi Menu' \
		 -mesg "Connection: $connection_status_label" \
	     -theme-str 'window {width: 400px; height: 320px;}' \
	     -theme-str 'inputbar {enabled: false;}'
}

password_cmd() {
	rofi -dmenu -password -mesg "Enter password for $1" \
	     -theme-str 'window {width: 400px; height:200px;}' \
	     -theme-str 'textbox-prompt-colon {str: "󰌾 ";}' \
	     -theme-str 'entry {placeholder: "Enter password";}'
}

manual_input() {
	rofi -dmenu -p "$1" \
	     -theme-str 'window {width: 400px; height: 200px;}' \
	     -theme-str 'entry {placeholder: "'$2'";}' \
		 -mesg "$1"
}

main_choice=$(echo -e "$main_menu_items" | rofi_cmd)
[ -z "$main_choice" ] && exit 0

### === MAIN MENU CHOICE ===

if [[ "$main_choice" == "󱛅  Disable Wi-Fi" ]]; then
	nmcli radio wifi off && notify-send "Wi-Fi Disabled" "Wireless was turned off"
	exit 0
elif [[ "$main_choice" == "󱛅  Enable Wi-Fi" ]]; then
	nmcli radio wifi on && notify-send "Wi-Fi Enabled" "Wireless was turned on"
	exit 0
fi

# Disconnect
if [[ "$main_choice" == "󱚼  Disconnect Wi-Fi" ]]; then
	nmcli device disconnect "$iface" && notify-send "Wi-Fi" "Disconnected from $iface"
	exit 0
fi

# nmtui
if [[ "$main_choice" == "󱚼  Disconnected" ]]; then
	kitty -e nmtui 2>/dev/null || alacritty -e nmtui 2>/dev/null || foot -e nmtui
	exit 0
fi

# Manual Entry
if [[ "$main_choice" == "$option_2" ]]; then
	ssid=$(manual_input "Enter SSID" "SSID")
	[ -z "$ssid" ] && notify-send "Wi-Fi" "SSID required" && exit 1

	password=$(password_cmd "$ssid")
	ifname=$(manual_input "Enter interface name" "$iface")
	[ -z "$ifname" ] && ifname="$iface"

	conn_name=$(manual_input "Enter connection name" "wifi-$ssid")
	[ -z "$conn_name" ] && conn_name="wifi-$ssid"

	nmcli connection delete "$conn_name" >/dev/null 2>&1

	nmcli connection add type wifi ifname "$ifname" con-name "$conn_name" ssid "$ssid" \
		wifi-sec.key-mgmt wpa-psk wifi-sec.psk "$password"

	if nmcli connection up "$conn_name"; then
		notify-send "Wi-Fi Connected" "Connected to $ssid"
	else
		notify-send "Wi-Fi Error" "Failed to connect to $ssid"
	fi
	exit 0
fi

# Wi-Fi List
if [[ "$main_choice" == "$option_1" ]]; then

	nmcli device wifi rescan >/dev/null 2>&1 &
	sleep 2

	wifi_list=$(nmcli -t -f SSID,SECURITY dev wifi list | awk -F: '!seen[$1]++ && $1!="" {print $1}')
	[ -z "$wifi_list" ] && notify-send "Wi-Fi" "No networks found" && exit 1

	chosen=$(echo "$wifi_list" | rofi -dmenu -i -p 'Select Wi-Fi' \
		-theme-str 'window {width: 420px;}' \
		-theme-str 'entry {placeholder: "Search network...";}')
	[ -z "$chosen" ] && exit 0

	security=$(nmcli -t -f SSID,SECURITY dev wifi list | grep -F "$chosen" | head -n1 | cut -d: -f2)
	open_net=$(echo "$security" | grep -qi 'none' && echo "true" || echo "false")

	conn_name="wifi-$chosen"
	nmcli connection delete "$conn_name" >/dev/null 2>&1

	if [[ "$open_net" == "false" ]]; then
		password=$(password_cmd "$chosen")
		[ -z "$password" ] && notify-send "Wi-Fi" "Connection canceled for $chosen" && exit 1
		nmcli connection add type wifi ifname "$iface" con-name "$conn_name" ssid "$chosen" \
			wifi-sec.key-mgmt wpa-psk wifi-sec.psk "$password"
	else
		nmcli connection add type wifi ifname "$iface" con-name "$conn_name" ssid "$chosen" \
			wifi-sec.key-mgmt none
	fi

	if nmcli connection up "$conn_name"; then
		notify-send "Wi-Fi Connected" "Connected to $chosen"
	else
		notify-send "Wi-Fi Error" "Failed to connect to $chosen"
	fi
fi
