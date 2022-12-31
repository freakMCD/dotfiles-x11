#!/bin/bash

echo "Enter URL here:"
read URL 

echo "Enter START_TIME here:"
read START

echo "Enter DURATION here:"
read DURATION

echo "Enter RESOLUTION here:"
read RESOLUTION

echo "Enter OUTPUT name here:"
read OUTPUT

ffmpeg $(yt-dlp -g $URL | sed "s/.*/-ss $START -i &/") -t $DURATION -s $RESOLUTION $OUTPUT
