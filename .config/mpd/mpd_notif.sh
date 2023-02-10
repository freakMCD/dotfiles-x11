#!/bin/bash


form="\n<span size='13pt'>%title%</span>\n<span size='8pt' weight='ultrabold' text_transform='uppercase'>%artist%</span>\n<span size='9pt' color='##A3A3A3'><i>%album%</i></span>" 


while "true"; do
   
    artpath="$HOME/Music/2015-2022/"$(mpc status -f '%file%' | head -n1)""
    status=$(mpc status %state%)
    cover="$HOME/Music/2015-2022/cover/"$(basename "$artpath" .m4a)".jpg"

    if [[ ! -f "$cover" ]]; then 
	ffmpeg -an -n -i "$artpath" -vf scale="480:270" "$cover"
    fi

    if [[ $status == 'playing' ]]; then
	notify-send -a mpd --hint=string:x-dunst-stack-tag:mpd "" "$(mpc --format "$form" current)" -i "$cover" -t 3000
    elif [[ $status == 'paused' ]]; then
	notify-send -a mpd --hint=string:x-dunst-stack-tag:mpd "" "$(mpc --format "$form" current)" -i "$cover" -t 1000
    else 
	notify-send "CODE WHEN WRONG"
    fi
    mpc idle player
done 

