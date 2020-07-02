#!/bin/bash
internal=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep eDP)
left=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep "DP-2")
right=$(xrandr -q | grep " connected" | cut -d" " -f1 | grep "HDMI-1")

if [ -z "$left" ]; then
  exit 0
else
  xrandr --output "$left" --mode 1600x900 --left-of "$right"
  xrandr --output "$right" --mode 1600x900 --right-of "$left"
fi
