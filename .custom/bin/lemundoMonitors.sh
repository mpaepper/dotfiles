#!/bin/bash

xrandr --output DP-3-2 --off --output DP-2-2 --off --output DP-1 --off
xrandr --output eDP-1 --mode 1920x1080 --right-of DP-3-2 --output DP-3-2 --mode 1920x1080 --primary
