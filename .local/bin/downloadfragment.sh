#!/bin/bash

echo "Enter URL here"
read URL 

echo "Enter START_TIME (hh:mm:ss)"
read START

echo "Enter DURATION (in seconds)"
read DURATION

echo "Enter RESOLUTION (HxW)"
read RESOLUTION

echo "Enter OUTPUT (name.ext)"
read OUTPUT

ffmpeg $(yt-dlp -g $URL | sed "s/.*/-ss $START -i &/") -t $DURATION -s $RESOLUTION $OUTPUT
