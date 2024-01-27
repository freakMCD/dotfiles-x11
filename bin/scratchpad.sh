#!/bin/bash
xdotool search --onlyvisible --classname $1 windowunmap || xdotool search --classname $1 windowmap || TMOUT=0 st -c scratchpad -n $1 -g $2 -e $3 & disown

