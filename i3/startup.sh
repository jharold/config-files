#!/bin/bash
if [ "$(lsusb | grep Dock | cut -d' ' -f7-)" == 'Lenovo ThinkPad Mini Dock Plus Series 3' ]; then
  xrandr && xrandr --output HDMI3 --primary --auto --output HDMI2 --right-of HDMI3 --auto --output LVDS1 --off
fi
i3-msg "workspace 1; append_layout ~/.config/i3/workspace_1.json"
(google-chrome-unstable &)
#i3-msg "workspace 2; append_layout ~/.config/i3/workspace_2.json" 
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.json" 
(gnome-terminal --role gnome-terminal1&)
(gnome-terminal --role gnome-terminal2&)
(gnome-terminal --role gnome-terminal3&)
(gnome-terminal --role gnome-terminal4&)
(gnome-terminal --role gnome-terminal5&)
(gnome-terminal --role gnome-terminal6&)
