#!/bin/bash

r=10
for ((i=0; i<r; i++)); do
    sleep 6
    if nslookup google.com 1>/dev/null 2>&1 
    then
        st -n newsraft -g 80x25+200+0 newsraft &
        break
    fi
done
