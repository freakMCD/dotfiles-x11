#!/bin/sh
mpc pause
notify-send -t 120000 "Hora de Ejercicio" 
mpv --shuffle --save-position-on-quit=no https://www.youtube.com/playlist?list=PL4CmunqMOJjLhWvgQUXWvewHEOoPAVAkt
