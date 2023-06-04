#!/bin/bash

notify_id=506

function get_volume {
    pactl get-sink-volume 0 | awk '{print $5}' | cut -d '%' -f 1
}

function get_volume_icon {
    if [ "$1" -lt 34 ]
    then
        echo -n "󰕿"
    elif [ "$1" -lt 67 ]
    then
        echo -n "󰖀"
    elif [ "$1" -le 100 ]
    then
        echo -n "󰕾"
    else
        echo -n "audio-volume-overamplified-symbolic.symbolic.png"
    fi
}

function volume_notification {
    volume=`get_volume`
    vol_icon=`get_volume_icon $volume`
    bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')
    dunstify -r $notify_id -u low "$vol_icon $bar"
}

function mute_notification {
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    if [ $muted == 'yes' ]
    then
        dunstify -r $notify_id -u low "󰝟  muted"
    else
        dunstify -r $notify_id -u low "$(get_volume_icon $(get_volume))  unmute"
    fi
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
