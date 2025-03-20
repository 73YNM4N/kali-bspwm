#!/usr/bin/env bash

# Rofi CMD
rofi_cmd() {
  rofi -dmenu \
    -p " Themes polybar " \
    \
    -theme /home/kali/.config/bspwm/scripts/ThemeSelector/style.rasi
}

arc=' Arc'
colors=' colors'
blocks='󰆧 blocks'
forest='󰐅 forest'
windows=' windows'

run_rofi() {
  echo -e "$arc\n$colors\n$blocks\n$forest\n$windows" | rofi_cmd
}
polybar_launch="/home/kali/.config/polybar/launch.sh"

chosen="$(run_rofi)"
case "$chosen" in
"$arc")
  "$polybar_launch" --arc
  ;;
"$colors")
  "$polybar_launch" --colors
  ;;
"$blocks")
  "$polybar_launch" --blocks
  ;;
"$forest")
  "$polybar_launch" --forest
  ;;
"$windows")
  "$polybar_launch" --windows
  ;;
esac
