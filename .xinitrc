 vim: set filetype=sh :

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi 

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Autostart Programs
~/bin/startup/newsraft.sh &
st -n neomutt -g 80x25+200+0 neomutt &
mpc random on && mpc add / &
dunst &

# Start dwm
~/bin/startup/signals/mpc_status &
~/bin/startup/dwm-status & 
exec ~/bin/startdwm
