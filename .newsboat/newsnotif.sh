#!/bin/bash

click_action () {
	i3-msg '[instance=newsboat] focus'
}

if [[ "$*" != "0 unread articles" ]]; then
    ACTION=$(dunstify -t 60000 -i ~/.newsboat/rss.png --action="default,Click" "newsboat" "$*")
    case "$ACTION" in
	    "default")
 	 	    click_action
	    ;;
    esac
fi

