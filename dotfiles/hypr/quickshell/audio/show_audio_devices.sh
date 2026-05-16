#!/bin/bash
PIDFILE="/tmp/quickshell_audio_devices.pid"
CONFIG="$HOME/.config/hypr/quickshell/audio/audio_devices.qml"

if [ -f "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE")

    if kill -0 "$PID" 2>/dev/null; then
        kill "$PID"
        rm "$PIDFILE"
        exit 0
    else
        rm "$PIDFILE"
    fi
fi

# start new instance
quickshell --path "$CONFIG" &

echo $! > "$PIDFILE"
