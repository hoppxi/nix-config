#!/usr/bin/env bash

get_status() {
    current_status=$(playerctl status 2>/dev/null)
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)

    if [[ "$current_status" == "Playing" || "$current_status" == "Paused" ]]; then
        # Escape special characters to prevent rofi message issues
        current_playing="Now Playing: ${artist//&/&amp;} - ${title//&/&amp;}"
    else
        current_playing="Nothing Playing"
    fi

    if [[ "$current_status" == "Playing" ]]; then
        playpause_label="⏸ Pause"
    elif [[ "$current_status" == "Paused" ]]; then
        playpause_label="▶ Play"
    else
        playpause_label="▶ Play"
    fi
}

run_cmd() {
    echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi -dmenu \
        -p "Music" \
        -mesg "$current_playing" \
        -theme-str "window {width: 400px;}" \
        -theme-str 'inputbar { enabled: false; }'
}

get_status
option_1="$playpause_label"
option_2="  Stop"
option_3="  Kill player"
option_4="󰌧  Launch ncmpcpp"

while true; do
    choice=$(run_cmd)

    case "$choice" in
        "$option_1")
            if playerctl status &>/dev/null; then
                playerctl play-pause
            else
                notify-send "No media player found" "Unable to toggle playback."
            fi
            ;;
        "$option_2")
            if playerctl status &>/dev/null; then
                playerctl stop
            else
                notify-send "No media player found" "Nothing to stop."
            fi
            break
            ;;
        "$option_3")
            if playerctl -l 2>/dev/null | grep -q .; then
                playerctl -a stop
            else
                notify-send "No players found" "Nothing to kill."
            fi
            break
            ;;
        "$option_4")
            kitty -e ncmpcpp
            break
            ;;
        "")
            break
            ;;
    esac

    get_status
done
