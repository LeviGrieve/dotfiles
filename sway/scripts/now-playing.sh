#!/bin/bash
status=$(playerctl status 2>/dev/null)

if [ -z "$status" ] || [ "$status" = "Stopped" ]; then
    exit 0
fi

title=$(playerctl metadata title 2>/dev/null)
max=30

if [ ${#title} -gt "$max" ]; then
    title="${title:0:$max}..."
fi

printf 'Now Playing: "%s"\n' "$title"

