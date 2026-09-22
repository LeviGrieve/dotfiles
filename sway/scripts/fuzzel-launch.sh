#!/bin/sh
output=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true) | .name')

if [ "$output" = "eDP-1" ]; then
    fuzzel --config ~/.config/fuzzel/laptop.ini
else
    fuzzel --config ~/.config/fuzzel/monitor.ini
fi
