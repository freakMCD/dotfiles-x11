#!/bin/bash

xdotool search --onlyvisible --classname $1 windowunmap || xdotool search --classname $1 windowmap || st -n $1 -g $2 -e $3
