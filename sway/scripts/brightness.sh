#!/bin/sh
case "$1" in
  up)
    brightnessctl set +5%
    ;;
  down)
    brightnessctl set 5%-
    ;;
esac

pct=$(brightnessctl -m | cut -d, -f4 | tr -d '%')
notify-send -t 1500 -h string:x-canonical-private-synchronous:brightness -h int:value:"$pct" "Brightness: ${pct}%"
