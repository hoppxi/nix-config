#!/usr/bin/env bash

COVER="/tmp/.music_cover.jpg"
DEFAULT_COVER="./assets/wallpaper1.jpg"

## Get status
get_status() {
	if playerctl status 2>/dev/null | grep -qi "Playing"; then
		echo ""
	else
		echo ""
	fi
}

## Get song (title)
get_song() {
	song=$(playerctl metadata title 2>/dev/null)
	if [[ -z "$song" ]]; then
		echo "There is nothing playing"
	else
		echo "$song"
	fi
}

## Get artist
get_artist() {
	artist=$(playerctl metadata artist 2>/dev/null)
	if [[ -z "$artist" ]]; then
		echo "Nothing playing"
	else
		echo "$artist"
	fi
}

## Get current playback position
get_ctime() {
	ctime=$(playerctl position 2>/dev/null | awk '{printf "%d:%02d", $1/60, $1%60}')
	if [[ -z "$ctime" ]]; then
		echo "0:00"
	else
		echo "$ctime"
	fi
}

## Get total duration
get_ttime() {
	ttime=$(playerctl metadata mpris:length 2>/dev/null)
	if [[ -z "$ttime" ]]; then
		echo "0:00"
	else
		# Convert microseconds to minutes:seconds
		ttime_sec=$((ttime / 1000000))
		printf "%d:%02d\n" $((ttime_sec / 60)) $((ttime_sec % 60))
	fi
}

## Get playback percentage
get_time() {
	position=$(playerctl position 2>/dev/null)
	duration=$(playerctl metadata mpris:length 2>/dev/null)

	if [[ -z "$position" || -z "$duration" ]]; then
		echo "0"
	else
		pos_sec=${position%.*}
		dur_sec=$((duration / 1000000))
		percent=$((100 * pos_sec / dur_sec))
		echo "$percent"
	fi
}

## Attempt to extract cover art from metadata URL
get_cover() {
	art_url=$(playerctl metadata mpris:artUrl 2>/dev/null | sed 's/^file:\/\///')
	if [[ -n "$art_url" && -f "$art_url" ]]; then
		cp "$art_url" "$COVER"
		echo "$COVER"
	else
		echo "$DEFAULT_COVER"
	fi
}

## Control
if [[ "$1" == "--song" ]]; then
	get_song
elif [[ "$1" == "--artist" ]]; then
	get_artist
elif [[ "$1" == "--status" ]]; then
	get_status
elif [[ "$1" == "--time" ]]; then
	get_time
elif [[ "$1" == "--ctime" ]]; then
	get_ctime
elif [[ "$1" == "--ttime" ]]; then
	get_ttime
elif [[ "$1" == "--cover" ]]; then
	get_cover
elif [[ "$1" == "--toggle" ]]; then
	playerctl play-pause
elif [[ "$1" == "--next" ]]; then
	playerctl next
	get_cover
elif [[ "$1" == "--prev" ]]; then
	playerctl previous
	get_cover
fi
