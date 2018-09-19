#!/bin/bash

xrandr --output DP3-2 --off --output DP-3-1 --off --output DP-1 --off
xrandr --output eDP-1 --mode 1920x1080 --left-of DP-3-1 --output DP-3-1 --mode 1920x1080 --primary
