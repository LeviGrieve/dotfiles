#!/bin/sh
dbus-monitor --system "type='signal',interface='org.freedesktop.DBus.Properties',path_namespace='/org/bluez'" |
while read -r line; do
    case "$line" in
        *"Connected"*)
            read -r _
            read -r variant
            case "$variant" in
                *"true"*)
                    notify-send -t 4000 "Bluetooth Connected"
                    ;;
                *"false"*)
                    notify-send -t 4000 "Bluetooth Disconnected"
                    ;;
            esac
            ;;
    esac
done
