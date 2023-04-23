# vim: set filetype=sh :
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
~/bin/startup/start_if_network_on.sh &
mpc random on && mpc add / &
dunst &

#start dwm
~/bin/startup/mpcsignal &
~/bin/startup/dwm-status &
exec ~/bin/startdwm
