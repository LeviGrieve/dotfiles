#!/bin/sh
STATE_FILE="/tmp/battery-notify-state"
BAT="/sys/class/power_supply/BAT0"

while true; do
    capacity=$(cat "$BAT/capacity" 2>/dev/null)
    status=$(cat "$BAT/status" 2>/dev/null)
    last=$(cat "$STATE_FILE" 2>/dev/null || echo "none")

    if [ "$status" = "Discharging" ]; then
        if [ "$capacity" -le 10 ] && [ "$last" != "critical" ]; then
            notify-send -u critical -t 0 "Battery Critical" "${capacity}% remaining — plug in now"
            echo "critical" > "$STATE_FILE"
        elif [ "$capacity" -le 20 ] && [ "$capacity" -gt 10 ] && [ "$last" != "low" ] && [ "$last" != "critical" ]; then
            notify-send -u normal -t 8000 "Battery Low" "${capacity}% remaining"
            echo "low" > "$STATE_FILE"
        elif [ "$capacity" -gt 20 ]; then
            echo "none" > "$STATE_FILE"
        fi
    else
        echo "none" > "$STATE_FILE"
    fi

    sleep 60
done
