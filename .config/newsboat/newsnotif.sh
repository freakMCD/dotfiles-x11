#!/bin/bash

if [[ "$*" != "0 unread articles" ]]; then
    dunstify -t 60000 -i "$(dirname "$0")/rss.png" --action="default,Click" "newsboat" "$*"
fi

