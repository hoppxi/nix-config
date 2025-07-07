#!/usr/bin/env bash

# Theme Elements
prompt='Screenshot / Record'
mesg="DIR: $(xdg-user-dir PICTURES)/Screenshots"

option_1=" Capture Desktop"
option_2=" Capture Area"
option_3=" Capture Window"
option_4=" Capture in 5s"
option_5=" Capture in 10s"
option_6="  Start Recording"

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: 400px; height: 440px;}" \
	     -theme-str 'inputbar {enabled: false;}' \
	     -dmenu \
	     -p "$prompt" \
	     -mesg "$mesg" \
	     -markup-rows
}

# Pass options to Rofi
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Setup dirs and files
time=$(date +%Y-%m-%d-%H-%M-%S)
dir="$(xdg-user-dir PICTURES)/Screenshots"
file="Screenshot_${time}.png"
record_file="Recording_${time}.mp4"

mkdir -p "$dir"

# Notify (Mako-compatible)
notify() {
	notify-send "$1"
}

notify_view() {
	notify "Screenshot saved: $file"
	[ -x "$(command -v viewnior)" ] && viewnior "$dir/$file" &>/dev/null &
}

# Copy screenshot to clipboard
copy_clip() {
	tee "$file" | wl-copy --type image/png
}

# Countdown
countdown() {
	for sec in $(seq "$1" -1 1); do
		notify "Taking shot in: $sec"
		sleep 1
	done
}

# Screenshot types using grim & slurp
shot_full() {
	cd "$dir" && grim - | copy_clip
	notify_view
}

shot_area() {
	cd "$dir" && grim -g "$(slurp)" - | copy_clip
	notify_view
}

shot_window() {
	cd "$dir" && grim -g "$(slurp)" - | copy_clip
	notify_view
}

shot_delay() {
	delay="$1"
	countdown "$delay"
	sleep 1
	cd "$dir" && grim - | copy_clip
	notify_view
}

# wf-recorder
record_screen() {
	out="$dir/$record_file"
	notify "Recording started (Ctrl+C to stop)"
	wf-recorder -f "$out"
	notify "Recording saved: $record_file"
}

# Command handler
run_cmd() {
	case "$1" in
		--opt1) shot_full ;;
		--opt2) shot_area ;;
		--opt3) shot_window ;;
		--opt4) shot_delay 5 ;;
		--opt5) shot_delay 10 ;;
		--opt6) record_screen ;;
	esac
}

# Main
chosen="$(run_rofi)"
case "$chosen" in
	"$option_1") run_cmd --opt1 ;;
	"$option_2") run_cmd --opt2 ;;
	"$option_3") run_cmd --opt3 ;;
	"$option_4") run_cmd --opt4 ;;
	"$option_5") run_cmd --opt5 ;;
	"$option_6") run_cmd --opt6 ;;
esac
