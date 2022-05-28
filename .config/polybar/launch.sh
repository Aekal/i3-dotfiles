#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
 
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

# Launch polybar with tray on primary monitor
MONITOR=$PRIMARY polybar --reload default &
sleep 1

# Launch polybar on other monitors
for m in $OTHERS; do
  MONITOR=$m polybar --reload default &
done
