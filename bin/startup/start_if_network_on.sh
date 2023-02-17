#!/bin/bash

while "true"; do
    if [[ $(nmcli networking connectivity check eth0) == 'full' ]]; then
        urxvtc -name newsboat -e newsboat
        urxvtc -name neomutt -e neomutt
        exit 0
    fi
    sleep 1
done
