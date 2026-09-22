#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
STATE_FILE="/tmp/sway_wallpaper_index"

# Get sorted list of wallpapers
WALLPAPERS=($(ls "$WALLPAPER_DIR"/*.{jpg,jpeg,png,webp} 2>/dev/null | sort))
TOTAL_WALLPAPERS=${#WALLPAPERS[@]}

if [ "$TOTAL_WALLPAPERS" -eq 0 ]; then
    exit 1
fi

# Read current index or initialize to 0
if [ -f "$STATE_FILE" ]; then
    INDEX=$(cat "$STATE_FILE")
else
    INDEX=0
fi

# Ensure index remains within bounds if files are deleted
if [ "$INDEX" -ge "$TOTAL_WALLPAPERS" ]; then
    INDEX=0
fi

SELECTED_WALLPAPER="${WALLPAPERS[$INDEX]}"

# Apply the wallpaper smoothly
pkill swaybg
swaybg -i "$SELECTED_WALLPAPER" -m fill &

# If run with "init", set the wallpaper without advancing the index
if [ "$1" == "init" ]; then
    exit 0
fi

# Advance index for the next keypress
NEXT_INDEX=$(( (INDEX + 1) % TOTAL_WALLPAPERS ))
echo "$NEXT_INDEX" > "$STATE_FILE"
