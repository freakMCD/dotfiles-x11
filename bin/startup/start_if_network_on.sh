#!/bin/bash
sleep 5

st -n neomutt -g 80x25+297+1 -e neomutt &

while "true"; do
    if ping -c 5 -W 5 google.com 1>/dev/null 2>&1 
    then
        st -n newsraft -g 80x25+297+1 -e newsraft &
        break
    fi
    sleep 10
done
