#!/bin/sh

[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

killall i3bar

i3status_file=~/.config/i3status/config

# update i3status based on pywal colors.
sed -i -E 's/span color=\o047#[0-Z]{6}/span color=\o047'$color4'/' $i3status_file

i3bar --bar_id=bar-0

