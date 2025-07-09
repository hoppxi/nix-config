#!/usr/bin/env bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

option_1="󰆠  Full Screen"
option_2="󰆞  Select Area"
option_3="󰻃  Start Recording"
option_4="  Open Screenshot Folder"

chosen=$(
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | 
	rofi -dmenu \
		-p "Screenshot Menu" \
		-mesg "Screenshot and Record" \
		-theme-str "window {width: 400px;}" \
		-theme-str "inputbar {enabled: false;}"
)

case "$chosen" in
  "$option_1")
    filename="$SCREENSHOT_DIR/screenshot-$(date +%Y%m%d%H%M%S).png"
    grim "$filename"
    notify-send "Screenshot Taken" "Full screen screenshot saved to $filename"
    ;;

  "$option_2")
    filename="$SCREENSHOT_DIR/screenshot-$(date +%Y%m%d%H%M%S).png"
    grim -g "$(slurp)" "$filename"
    notify-send "Screenshot Taken" "Selected area screenshot saved to $filename"
    ;;

  "$option_3")
    filename="$SCREENSHOT_DIR/recording-$(date +%Y%m%d%H%M%S).mp4"
    wf-recorder -f "$filename" &
    recorder_pid=$!
    notify-send "Recording Started" "Recording started. Press Ctrl+F11 to stop."

    # Monitor wf-recorder process
    while kill -0 "$recorder_pid" 2>/dev/null; do
      sleep 1
    done

    notify-send "Recording Stopped" "Recording saved to $filename"
    ;;

  "$option_4")
    thunar "$SCREENSHOT_DIR" &
    ;;

  *)
    ;;
esac
