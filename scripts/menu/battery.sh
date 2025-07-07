#!/usr/bin/env bash


# Get battery path
BATTERY_PATH=$(upower -e | grep 'battery')
UP_DATA=$(upower -i "$BATTERY_PATH")

# Extract battery data
status=$(echo "$UP_DATA" | grep "state" | awk '{print $2}')
percentage=$(echo "$UP_DATA" | grep "percentage" | awk '{print $2}' | tr -d '%')
time=$(echo "$UP_DATA" | grep -E "time to empty|time to full" | awk -F':' '{print $2 ":" $3}' | sed 's/^[ \t]*//')
[ -z "$time" ] && time="Fully Charged"

# Determine battery icon
if [[ $percentage -ge 0 && $percentage -le 19 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -ge 20 && $percentage -le 39 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -ge 40 && $percentage -le 59 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -ge 60 && $percentage -le 79 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -ge 80 && $percentage -le 100 ]]; then
    ICON_DISCHRG=""
fi

# Charging icon
ICON_CHRG=""

# Rofi Options
option_1="$ICON_DISCHRG  Remaining: ${percentage}%"
option_2="$ICON_CHRG  Status: ${status}"
option_3="  Diagnose (powertop)"

# Rofi appearance config
rofi_cmd() {
	rofi -dmenu \
		-p "Battery" \
		-mesg "Status: $status | ${percentage}% | $time" \
		-theme-str 'window {width: 400px; height: 250px;} listview {lines: 4; columns: 1;}' \
		-theme-str 'inputbar {enabled: false;}'
}

# Show Rofi menu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3" | rofi_cmd
}

# Execute user command
run_cmd() {
	polkit_cmd="pkexec env PATH=$PATH DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY"
	case "$1" in
		--opt1) notify-send -u low "Battery" "Remaining: ${percentage}%" ;;
		--opt2) notify-send -u low "Battery" "Status: $status" ;;
		--opt3) ${polkit_cmd} kitty -e sudo powertop ;;
	esac
}

# Main
chosen="$(run_rofi)"
case "$chosen" in
	"$option_1") run_cmd --opt1 ;;
	"$option_2") run_cmd --opt2 ;;
	"$option_3") run_cmd --opt3 ;;
esac
