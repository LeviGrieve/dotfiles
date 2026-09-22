#!/bin/bash
status=$(playerctl status 2>/dev/null)

if [ -z "$status" ]; then
    exit 0
fi

if [ "$status" = "Playing" ]; then
    printf '\uf04c\n'
else
    printf '\uf04b\n'
fi
