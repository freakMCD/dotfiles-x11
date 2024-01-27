#!/bin/bash

# Path to the mpv socket directory
mpv_socket_dir="/tmp/mpvSockets"

# Get the PID of the first mpv window
mpv_pid=$1

# Get the list of all mpv windows
mpv_windows=$(pidof mpv)

# Loop through mpv windows
for pid in $mpv_windows; do
    if [ "$pid" == "$mpv_pid" ]; then
        # Unmute and play the first mpv window
        echo '{ "command": ["set_property", "pause", false] }' | socat - $mpv_socket_dir/$mpv_pid
    else
        # Mute and pause other mpv windows
        echo '{ "command": ["set_property", "pause", true] }' | socat - $mpv_socket_dir/$pid
    fi
done
