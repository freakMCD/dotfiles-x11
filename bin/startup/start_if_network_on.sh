#!/bin/bash

while "true"; do
    if ping -c 10 -W 5 google.com 1>/dev/null 2>&1 
    then
        st -n neomutt -g 80x25+297+1 -e neomutt &
        st -n newsboat -g 80x25+297+1 -e newsboat &
        break
    fi
    sleep 30
done
