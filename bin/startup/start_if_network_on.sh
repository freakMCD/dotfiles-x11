#!/bin/bash
sleep 5
while "true"; do
    if ping -c 5 -W 5 google.com 1>/dev/null 2>&1 
    then
        st -n neomutt -g 80x25+297+1 -e neomutt &
        if [[ `date +%w` = @(0|4) ]]
        then
            st -n newsboat -g 80x25+297+1 -e newsboat &
        fi
        break
    fi
    sleep 10
done
