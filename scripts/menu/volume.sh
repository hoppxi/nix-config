#!/usr/bin/env bash

# Rofi menu launcher
rofi_cmd() {
	speaker=$(pamixer --get-volume)
	speaker_muted=$(pamixer --get-mute)
	mic_volume=$(pamixer --default-source --get-volume)
	mic_muted=$(pamixer --default-source --get-mute)

	# Set speaker state
	if [[ "$speaker_muted" == true ]]; then
		speaker_text="Unmute Speaker"
		speaker_icon=""
		speaker_state="-u 2"
	else
		speaker_text="Mute Speaker"
		speaker_icon=""
		speaker_state="-a 2"
	fi

	# Set mic state
	if [[ "$mic_muted" == true ]]; then
		mic_text="Unmute Mic"
		mic_icon=""
		mic_state="-u 4"
	else
		mic_text="Mute Mic"
		mic_icon=""
		mic_state="-a 4"
	fi

	prompt="Volume menu"
	message="Speaker: $speaker%, Mic: $mic_volume%"

	option_1="  Increase Volume"
	option_2="$speaker_icon  $speaker_text"
	option_3="  Decrease Volume"
	option_4="$mic_icon  $mic_text"
	option_5="  Launch pavucontrol"

	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi \
		-theme-str "window {width: 400px; height: 320px;}" \
		-theme-str "inputbar {enabled: false;}" \
		-dmenu \
		-p "$prompt" \
		-mesg "$message"
}

# Main loop
while true; do
	choice=$(rofi_cmd)

	case "$choice" in
		*"Increase Volume"*) pamixer -i 5 ;;
		*"Decrease Volume"*) pamixer -d 5 ;;
		*"Mute Speaker"* | *"Unmute Speaker"*) pamixer -t ;;
		*"Mute Mic"* | *"Unmute Mic"*) pamixer --default-source -t ;;
		*"Launch pavucontrol"*) pavucontrol; break ;;
		"" ) break ;;
	esac
done
