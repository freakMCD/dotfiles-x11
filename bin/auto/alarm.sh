#!/bin/sh
mpc pause
notify-send -t 120000 "Workout" 
mpv --shuffle --volume=80 --save-position-on-quit=no https://www.youtube.com/playlist?list=PL4CmunqMOJjLhWvgQUXWvewHEOoPAVAkt
