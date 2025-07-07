#!/usr/bin/env bash

# Rofi menu launcher
rofi_cmd() {

	speaker=$(pamixer --get-volume)
	speaker_muted=$(pamixer --get-mute)
	mic_muted=$(pamixer --default-source --get-mute)
	mic_volume=$(pamixer --default-source --get-volume)

	# Speaker toggle state
	if [[ "$speaker_muted" == false ]]; then
		active="-a 1"
		stext='Unmute'
		sicon=''
	else
		urgent="-u 1"
		stext='Mute'
		sicon=''
	fi

	# Mic toggle state
	if [[ "$mic_muted" == false ]]; then
		[[ -n "$active" ]] && active+=",3" || active="-a 3"
		mtext='Unmute'
		micon=''
	else
		[[ -n "$urgent" ]] && urgent+=",3" || urgent="-u 3"
		mtext='Mute'
		micon=''
	fi

	prompt="S:$stext, M:$mtext"
	mesg="Speaker: $speaker%, Mic: $mic_volume%"

	option_1=" Increase"
	option_2="$sicon $stext"
	option_3=" Decrease"
	option_4="$micon $mtext"
	option_5=" Settings"

	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi \
		-theme-str "window {width: 400px; height: 320px;}" \
		-theme-str "inputbar {enabled: false;}" \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		${active} ${urgent} \
		-markup-rows 
}

# Loop menu
while true; do
	choice=$(rofi_cmd)

	case "$choice" in
		*"Increase"*) pamixer -i 5 ;;
		*"Decrease"*) pamixer -d 5 ;;
		*"" | *""*) pamixer -t ;;
		*"" | *""*) pamixer --default-source -t ;;
		*""*) pavucontrol; break ;;
		"" ) break ;;
	esac
done
