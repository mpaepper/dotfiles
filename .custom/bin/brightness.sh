#!/bin/bash

monitors="$(xrandr | grep " connected" | cut -f1 -d " ")"
for monitor in $monitors; do
    xrandr --output $monitor --brightness $1
done
