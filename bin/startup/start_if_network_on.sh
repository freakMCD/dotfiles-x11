#!/bin/bash

while "true"; do
    if [[ $(nmcli networking connectivity check eth0) == 'full' ]]; then
        urxvtc -name neomutt -geometry 80x25+297+1 -e neomutt
        urxvtc -name newsboat -geometry 80x25+297+1 -e newsboat
        exit 0
    fi
    sleep 30
done
