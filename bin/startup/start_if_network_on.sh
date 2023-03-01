#!/bin/bash

while "true"; do
    if ping -c 10 -W 5 google.com 1>/dev/null 2>&1 
    then
        urxvtc -name neomutt -geometry 80x25+297+1 -e neomutt
        urxvtc -name newsboat -geometry 80x25+297+1 -e newsboat
        break
    fi
    sleep 30
done
