[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
urxvtd -q -o -f
urxvtc -name trans -e sh -c 'trans -I'
~/.config/i3/start_if_network_on.sh
mpc random on && mpc load 2015-2022
~/.config/mpd/mpd_notif.sh &
dunst &
exec i3

