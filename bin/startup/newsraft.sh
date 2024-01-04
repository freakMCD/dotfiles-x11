#!/bin/bash

newsraft="st -n newsraft -g 80x25+200+0 newsraft"

r=10
for ((i=0; i<r; i++)); do
    sleep 6
    if nslookup google.com 1>/dev/null 2>&1 
    then
        $newsraft &
        break
    fi
done

sleep 10

interval=7200
while :
do
    pkill -x newsraft
    sleep 1
    unread=$(sqlite3 -line ~/.local/share/newsraft/newsraft.sqlite3 'SELECT COUNT() FROM items WHERE unread = 1' | sed s/"COUNT() = "//g)

    if [[ $unread != "0" ]]; then
        notify-send -t 30000 "Newsraft" "$unread feeds unread"
    fi
    $newsraft &
    now=$(date +%s) # timestamp in seconds
    sleep $((interval - now % interval))
done
