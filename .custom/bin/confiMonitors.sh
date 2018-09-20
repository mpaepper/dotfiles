#!/bin/bash

xrandr --output DP3-2 --off --output DP-2-2 --off --output HDMI-1 --off
xrandr --output eDP-1 --mode 1920x1080 --primary --right-of HDMI-1 --output HDMI-1 --mode 1920x1080
