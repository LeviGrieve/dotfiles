#!/bin/sh
nmcli monitor | while read -r line; do
    case "$line" in
        *"connected"*"(wireless"*|*"using connection"*)
            ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
            [ -n "$ssid" ] && notify-send -t 4000 "Wi-Fi Connected" "$ssid"
            ;;
        *"disconnected"*)
            notify-send -t 4000 "Wi-Fi Disconnected"
            ;;
    esac
done
