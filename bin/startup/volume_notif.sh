#!/bin/bash
# changeVolume

msgTag="myvolume"

function get_volume {
    pactl get-sink-volume 0 | awk '{print $5}' | cut -d '%' -f 1
}

function volume_notification {
    volume=`get_volume`

    # Show the volume notification
    dunstify -a "changeVolume" -u low -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"

    # Play the volume changed sound
    canberra-gtk-play -i audio-volume-change -d "changeVolume"
}

function mute_notification {
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

    if [ $muted == 'yes' ]
    then
        dunstify -a "changeVolume" -u low -h string:x-dunst-stack-tag:$msgTag "Volume muted"
    else
        volume_notification
    fi
    canberra-gtk-play -i audio-volume-change -d "changeVolume"
}

function mic_notification {
	volume=$(pactl get-source-mute 0)
	
	if [[ "$volume" == "Mute: yes" ]]; then
		notify-send -t 0 --hint=string:x-dunst-stack-tag:mic ""
	elif [[ "$volume" == "Mute: no" ]]; then
		notify-send -t 5000 --hint=string:x-dunst-stack-tag:mic ""
	else 
		notify-send "CODE WHEN WRONG"
	fi
}

case $1 in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        volume_notification
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        volume_notification
	    ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        mute_notification
        ;;
    mic)
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
        mic_notification
        ;;
    *)
        echo "Usage: $0 up | down | mute"
        ;;
esac
