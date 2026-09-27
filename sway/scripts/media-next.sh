#!/bin/bash
status=$(playerctl status 2>/dev/null)

if [ -z "$status" ] || [ "$status" = "Stopped" ]; then
    exit 0
fi

printf '\uf051\n'
