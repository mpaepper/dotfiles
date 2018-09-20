#!/bin/bash

monitor="$(xrandr | grep " connected" | cut -f1 -d " ")"
xrandr --output $monitor --brightness $1
