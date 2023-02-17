# vim: set filetype=sh :
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
urxvtd -q -o -f
~/bin/startup/start_if_network_on.sh
mpc random on && mpc load 2015-2022
dunst &

#start dwm
~/bin/startup/mpcsignal &
~/bin/startup/dwm-status &
exec ~/bin/startdwm
