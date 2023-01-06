#!/bin/bash

click_action () {
	exec urxvt -e sh -c newsboat
}

if [[ "$*" != "0 unread articles" ]]; then
	ACTION=$(dunstify -t 60000 -i ~/.newsboat/rss.png --action="default,Click" "newsboat" "$*")
	case "$ACTION" in
		"default")
 	 	  click_action
	  	;;
	esac
fi

