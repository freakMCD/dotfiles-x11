#!/bin/bash

while "true"; do
    if [[ $(nmcli networking connectivity check eth0) == 'full' ]]; then
        urxvtc -name neomutt -geometry 75x23+350-300 -e neomutt
        urxvtc -name newsboat -geometry 75x23-350+300 -e newsboat
        exit 0
    fi
    sleep 1
done
