#!/bin/sh

# Ensure runtime directory is set
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# Clean up any lingering or duplicate audio processes
pkill -9 -u $(id -u) -x pipewire
pkill -9 -u $(id -u) -x pipewire-pulse
pkill -9 -u $(id -u) -x wireplumber

# Clean up stale locks if present
rm -f $XDG_RUNTIME_DIR/pipewire-0* $XDG_RUNTIME_DIR/pulse/native

# Launch PipeWire, WirePlumber, and PulseAudio emulation sequentially
pipewire &
sleep 1
wireplumber &
pipewire-pulse &
