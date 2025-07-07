#!/usr/bin/env bash

rofi_cmd="rofi -dmenu -i -p 'Select Wi-Fi' -mesg"

current_connection=$(nmcli -t -f TYPE,DEVICE,STATE connection show --active | awk -F: '/ethernet|wifi/ {print $1 ": " $2}')
current_wifi=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)

wifi_list=$(nmcli -t -f SSID,SECURITY dev wifi list | awk -F: '!seen[$1]++ && $1!="" {print $1}')

message="Connected via: ${current_connection:-None}"
[ -n "$current_wifi" ] && message="$message (Wi-Fi: $current_wifi)"

rofi_cmd() {
	rofi \
		-dmenu \
		-i \
		-p 'Select Wi-Fi' \
		-mesg 'Wi-Fi' \
		-theme-str 'window {width: 400px;}' \
		-theme-str 'entry {placeholder: "Search Wi-Fi...";}' 
}

password_cmd() {
	rofi \
		-dmenu \
		-password \
		-mesg "Enter password for $chosen" \
		-theme-str 'window {width: 400px; height:200px;}' \
		-theme-str 'textbox-prompt-colon {str: "󰌾 ";}' \
		-theme-str 'entry {placeholder: "Enter password";}' 
}

chosen=$(echo "$wifi_list" | rofi_cmd "$message")

# Cancelled
[ -z "$chosen" ] && exit 0

# Check if it requires a password
security=$(nmcli -t -f SSID,SECURITY dev wifi list | grep -F "$chosen" | head -n1 | cut -d: -f2)
open_net=$(echo "$security" | grep -qi 'none' && echo "true" || echo "false")

# Prompt for password if needed
if [[ "$open_net" == "false" ]]; then
    password=$(password_cmd)
    [ -z "$password" ] && notify-send "Wi-Fi" "Connection canceled for $chosen" && exit 1
    nmcli dev wifi connect "$chosen" password "$password"
else
    nmcli dev wifi connect "$chosen" wifi-sec.key-mgmt none
fi

# Success or error notification
if [ $? -eq 0 ]; then
    notify-send "Wi-Fi Connected" "Successfully connected to $chosen"
else
    notify-send "Wi-Fi Error" "Failed to connect to $chosen"
fi
