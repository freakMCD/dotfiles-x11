#!/bin/bash

action () {
	exec urxvt -name floating -e sh -c newsboat
}

if [[ "$*" != "0 unread articles" ]]; then
	ACTION=$(dunstify -t 60000 -i ~/.newsboat/rss.png --action="default,Reply" "newsboat" "$*")

	case "$ACTION" in
		"default")
 	 	 action
	  	;;
	esac
fi


