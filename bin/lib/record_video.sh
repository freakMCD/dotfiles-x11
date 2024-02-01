#!/bin/bash

# Set the output file
output_file=~/MediaHub/recordings/recording_$(date +"%Y%m%d_%H%M%S").mp4

# Get information about the focused window using xdotool
eval $(xdotool getwindowfocus getwindowgeometry --shell)
sleep 0.01

# Extract window dimensions and position
window_x=$(echo "$X")
window_y=$(echo "$Y")
window_width=$(echo "$WIDTH")
window_height=$(echo "$HEIGHT")

# Round down the window dimensions to the nearest even numbers
window_width=$(($window_width & ~1))
window_height=$(($window_height & ~1))

# Set a common notification ID
notification_id=12345
sink="alsa_output.pci-0000_30_00.6.analog-stereo.monitor"

# Check if recording is already in progress
if pgrep -x "ffmpeg" > /dev/null
then
    # If it is, stop recording
    killall ffmpeg
    notify-send -t 3000 -u normal -r "$notification_id" "Recording stopped"
else
	case "$2" in
	    desktop)
	        case "$1" in
	            audioless)
	                ffmpeg -f x11grab -video_size 1920x1080 -framerate 30 -i :0.0 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p "$output_file" &
	                notify-send -t 0 -u normal -r "$notification_id" "Recording desktop"
	                ;;
	            audio)
	                ffmpeg -f x11grab -video_size 1920x1080 -framerate 30 -i :0.0 -f pulse -i "$sink" -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p "$output_file" &
	                notify-send -t 3000 -u normal -r "$notification_id" "Recording desktop w/audio"
	                ;;
	        esac
	        ;;
	    window)
	        case "$1" in
	            audioless)
	                ffmpeg -f x11grab -video_size "${window_width}x${window_height}" -framerate 30 -i :0.0+"$window_x","$window_y" -c:v libx264 -preset fast -crf 25 -profile:v baseline -vf format=yuv420p "$output_file" &
	                notify-send -t 0 -u normal -r "$notification_id" "Recording window"
	                ;;
	            audio)
	                ffmpeg -f x11grab -video_size "${window_width}x${window_height}" -framerate 30 -i :0.0+"$window_x","$window_y" -f pulse -i "$sink" -c:v libx264 -preset fast -crf 25 -profile:v baseline -vf format=yuv420p "$output_file" &
	                notify-send -t 3000 -u normal -r "$notification_id" "Recording window w/audio"
	                ;;
	        esac 
	        ;;
	esac
fi
