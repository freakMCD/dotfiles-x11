#!/bin/bash

while "true"; do
    if [[ $(nmcli networking connectivity check eth0) == 'full' ]]; then
        urxvtc -name neomutt -e neomutt
        urxvtc -name newsboat -e newsboat
        exit 0
    fi
    sleep 1
done
