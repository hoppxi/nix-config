#!/usr/bin/env bash

# Get battery device path (first battery found)
BATTERY_PATH=$(upower -e | grep 'battery' | head -n1)
UP_DATA=$(upower -i "$BATTERY_PATH")

# Extract battery data
status=$(echo "$UP_DATA" | grep "state" | awk '{print $2}')
percentage=$(echo "$UP_DATA" | grep "percentage" | awk '{print $2}' | tr -d '%')
time=$(echo "$UP_DATA" | grep -E "time to empty|time to full" | awk -F':' '{print $2 ":" $3}' | sed 's/^[ \t]*//')
[ -z "$time" ] && time="Fully Charged"

# Attempt to get battery health
health=$(echo "$UP_DATA" | grep "capacity" | awk '{print $2}')
if [ -z "$health" ]; then
  # fallback: try sysfs (may differ by system)
  BATTERY_SYS_PATH="/sys/class/power_supply/$(basename $BATTERY_PATH)"
  if [ -f "$BATTERY_SYS_PATH/health" ]; then
    health=$(cat "$BATTERY_SYS_PATH/health")
  else
    health="Unknown"
  fi
fi

# Determine battery icon based on percentage
if [[ $percentage -le 19 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -le 39 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -le 59 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -le 79 ]]; then
    ICON_DISCHRG=""
else
    ICON_DISCHRG=""
fi

# Charging icon
ICON_CHRG="󰂄"

# Rofi menu options
option_1="$ICON_DISCHRG  Remaining: ${percentage}%"
option_2="$ICON_CHRG  Status: ${status}"
option_3="󱈏  Health: ${health}"
option_4="  Launch powertop"

# Rofi appearance config
rofi_cmd() {
	rofi -dmenu \
		-p "Battery" \
		-mesg "Status: $status | ${percentage}% | $time" \
		-theme-str 'window {width: 400px; height: 280px;} listview {lines: 5; columns: 1;}' \
		-theme-str 'inputbar {enabled: false;}'
}

# Show Rofi menu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

# Execute user command
run_cmd() {
	polkit_cmd="pkexec env PATH=$PATH DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY"
	case "$1" in
		--opt1) notify-send -u low "Battery" "Remaining: ${percentage}%" ;;
		--opt2) notify-send -u low "Battery" "Status: $status" ;;
		--opt3) notify-send -u low "Battery" "Health: $health" ;;
		--opt4) $polkit_cmd kitty -e sudo powertop ;;
	esac
}

# Main
chosen="$(run_rofi)"
case "$chosen" in
	"$option_1") run_cmd --opt1 ;;
	"$option_2") run_cmd --opt2 ;;
	"$option_3") run_cmd --opt3 ;;
	"$option_4") run_cmd --opt4 ;;
esac
