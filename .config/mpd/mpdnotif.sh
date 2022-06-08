#!/bin/bash

#form="<b>Artist</b>\t<span color='##a1b56c'>%artist%</span>\n<b>Album</b>\t<span color='##6a9fb5'>%album%</span>\n<b>Title</b>\t<span color='##ac4142'>%title%</span>" 
form="\n<span color='##FFA348'>%artist%</span>\n<span color='##3584E4'>%album%</span>\n<span color='##57E389'>%title%</span>" 
while "true"; do
   
    artpath="$HOME/Música/2015-2022/"$(mpc status -f '%file%' | head -n1)""
    status=$(mpc status %state%)
    cover="$HOME/Música/2015-2022/cover/"$(basename "$artpath" .m4a)".jpg"

    if [[ ! -f "$cover" ]]; then 
	ffmpeg -an -n -i "$artpath" "$cover"
    fi

    if [[ $status == 'playing' ]]; then
	notify-send "♫ Now playing" "$(mpc --format "$form" current)" -i "$cover" -t 3000
    elif [[ $status == 'paused' ]]; then
	notify-send  "Paused" "$(mpc --format "$form" current)" -i "$cover" -t 1000
    else 
	notify-send "CODE WHEN WRONG"
    fi
    mpc idle player
done 

