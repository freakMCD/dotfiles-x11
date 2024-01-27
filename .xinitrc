 vim: set filetype=sh :

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi 

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Autostart Programs
~/.fehbg &
~/bin/autostart/newsraft.sh &
mpc random on && mpc add / &
dunst &
picom -b

# Start dwm
~/bin/autostart/signals/mpc_status &
aslstatus &
sxhkd &
exec ~/bin/startdwm
