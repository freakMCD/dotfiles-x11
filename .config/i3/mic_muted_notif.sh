#!/bin/bash

volume=$(pactl get-source-mute 0)

if [[ "$volume" == "Mute: yes" ]]; then
	notify-send -t 0 --hint=string:x-dunst-stack-tag:mic ""
elif [[ "$volume" == "Mute: no" ]]; then
	notify-send -t 5000 --hint=string:x-dunst-stack-tag:mic ""
else 
	notify-send "CODE WHEN WRONG"
fi
