#!/bin/bash
status=$(playerctl status 2>/dev/null)
[ -z "$status" ] && exit 0
printf '\uf048\n'
