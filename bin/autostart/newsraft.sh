#!/bin/bash

newsraft="st -c scratchpad -n newsraft -g 80x25+200+0 newsraft"
retry_count=16
sleep 5
for ((i=0; i<retry_count; i++)); do
    if nslookup google.com 1>/dev/null 2>&1 ; then
        sleep 10
        if nslookup google.com 1>/dev/null 2>&1 ; then
            $newsraft &
            aslstatus-update cmd:curl
            break
        fi
    fi
    sleep 30
done
