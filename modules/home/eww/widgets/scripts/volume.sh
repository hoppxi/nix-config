#!/usr/bin/env bash

# Functions
get_volume() {
    if [ -n "$SINK" ]; then
        pamixer --sink "$SINK" --get-volume
    else
        pamixer --get-volume
    fi
}

get_muted() {
    if [ -n "$SINK" ]; then
        pamixer --sink "$SINK" --get-mute | grep -q true && echo true || echo false
    else
        pamixer --get-mute | grep -q true && echo true || echo false
    fi
}

get_device() {
    if [ -n "$SINK" ]; then
        echo "$SINK"
    else
        default_sink=$(pactl info | awk -F': ' '/Default Sink/ {print $2}')

        pactl list sinks | awk -v sink="$default_sink" '
            $0 ~ "Name: " sink {found=1}
            found && /Ports:/ {ports=1; next}
            ports && /^\t/ {
                if ($0 ~ /Active Port: /) active_port=$3
                if ($0 ~ /^[^\t].*:/) ports=0
                if ($0 ~ /^[ \t]*([^:]+): .* \((.*)\)/) {
                    port_name = $1
                    gsub(":", "", port_name)
                    port_desc[port_name]=$2
                }
            }
            END {
                if (active_port in port_desc)
                    print port_desc[active_port]
                else if (active_port != "")
                    print active_port
            }
        '
    fi
}

get_mic_level() {
    if [ -n "$SOURCE" ]; then
        pamixer --source "$SOURCE" --get-volume
    else
        default_source=$(pactl info | awk -F': ' '/Default Source/ {print $2}')
        pamixer --source "$default_source" --get-volume
    fi
}

get_mic_muted() {
    local src="${SOURCE:-$(pactl info | awk -F': ' '/Default Source/ {print $2}')}"
    pamixer --source "$src" --get-mute | grep -q true && echo true || echo false
}


# Main logic
CMD1="$1"
CMD2="$2"
CMD3="$3"

# Support --sink <sink_id> or --source <source_id>
if [ "$CMD1" = "--sink" ]; then
    SINK="$CMD2"
    CMD1="$3"
    CMD2="$4"
    CMD3="$5"
elif [ "$CMD1" = "--source" ]; then
    SOURCE="$CMD2"
    CMD1="$3"
    CMD2="$4"
    CMD3="$5"
fi

run_cmd() {
    local cmd="$1"
    if [ "$cmd" = "--level" ]; then
        get_volume
    elif [ "$cmd" = "--muted" ]; then
        get_muted
    elif [ "$cmd" = "--device" ]; then
        get_device
    elif [ "$cmd" = "--mic-level" ]; then
        get_mic_level
    elif [ "$cmd" = "--mic-muted" ]; then
        get_mic_muted
    fi
}

run_cmd "$CMD1"
run_cmd "$CMD2"
run_cmd "$CMD3"
