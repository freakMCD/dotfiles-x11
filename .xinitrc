# vim: set filetype=sh :

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi 

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

~/bin/startup/start_if_network_on.sh &
mpc random on && mpc add / &
dunst &

#start dwm
~/bin/startup/mpcsignal &
~/bin/startup/dwm-status &
exec ~/bin/startdwm
