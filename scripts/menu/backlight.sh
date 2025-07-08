#!/usr/bin/env bash

while true; do
	# Get brightness info
	backlight=$(brightnessctl -m | cut -d, -f4 | tr -d '%')
	card=$(brightnessctl -m | cut -d, -f1)

	# Display text
	prompt="${backlight}%"
	mesg="Device: ${card}, Level: $backlight%"

	# Options
	option_1="  Increase"
	option_2="  Optimal"
	option_3="  Decrease"

	# Rofi menu
	choice=$(echo -e "$option_1\n$option_2\n$option_3" | rofi \
		-theme-str "window {width: 400px; height: 250px;}" \
		-theme-str 'inputbar {enabled: false;}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows)

	# Handle input
	case "$choice" in
		"$option_1") brightnessctl set 5%+ ;;
		"$option_2") brightnessctl set 40% ;;
		"$option_3") brightnessctl set 5%- ;;
		"" ) break ;; 
	esac
done
