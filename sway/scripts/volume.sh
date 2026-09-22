#!/bin/sh
LOCKFILE="/tmp/volume.lock"

exec 9>"$LOCKFILE"
flock 9

case "$1" in
  up)
    wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
    ;;
  down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    ;;
esac

vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -c MUTED)

if [ "$muted" -eq 1 ]; then
    notify-send -t 1500 -h string:x-canonical-private-synchronous:volume -h int:value:0 "Volume Muted"
else
    notify-send -t 1500 -h string:x-canonical-private-synchronous:volume -h int:value:"$vol" "Volume: ${vol}%"
fi
