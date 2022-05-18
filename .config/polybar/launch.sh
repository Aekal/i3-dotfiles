#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit
# killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    notify-send -i display "$m"
    MONITOR=$m polybar --reload default &
  done
else
  polybar --reload default &
fi
