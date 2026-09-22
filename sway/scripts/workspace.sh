#!/bin/sh
# Usage: workspace.sh <number> [move]
num="$1"
action="$2"

output=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true) | .name')
ws="${output}:${num}"

if [ "$action" = "move" ]; then
    swaymsg move container to workspace "$ws"
else
    swaymsg workspace "$ws"
fi
