#!/usr/bin/env bash

launch_arc() {

	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# bspwm config
	bspc config border_width 3
	bspc config top_padding 35
	bspc config bottom_padding 5
	bspc config left_padding 0
	bspc config right_padding 0
	bspc config normal_border_color "#2d2c55"
	bspc config focused_border_color "#0303b5"

	# wallpaper
	feh --bg-fill "$HOME"/.config/wallpaper-jpg/wall_0050.jpg

	# launcher bar
	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q arc -c "$HOME"/.config/polybar/arc/config.ini &
	done

	# rofi selector
	/bin/cat "$HOME/.config/polybar/arc/rofi/launcher/launcher_arc.sh" >"$HOME/.config/bspwm/scripts/rofiSelector.sh"

	# powermenu selector
	/bin/cat "$HOME/.config/polybar/arc/rofi/poweroff/poweroff_arc.sh" >"$HOME/.config/bspwm/scripts/powermenu.sh"

}

launch_colors() {

	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# bspwm config
	bspc config border_width 3
	bspc config top_padding 48
	bspc config bottom_padding 0
	bspc config left_padding 0
	bspc config right_padding 0
	bspc config normal_border_color "#005c7c"
	bspc config focused_border_color "#01c4e7"

	# wallpaper
	feh --bg-fill "$HOME"/.config/wallpaper-jpg/wall_0042.png

	# launcher bar
	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q colors -c "$HOME"/.config/polybar/colors/config.ini &
	done

	# rofi selector
	/bin/cat "$HOME/.config/polybar/colors/rofi/launcher/launcher.sh" >"$HOME/.config/bspwm/scripts/rofiSelector.sh"

	# powermenu selector
	/bin/cat "$HOME/.config/polybar/colors/rofi/poweroff/poweroff.sh" >"$HOME/.config/bspwm/scripts/powermenu.sh"
}

launch_blocks() {

	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# bspwm config
	bspc config border_width 3
	bspc config top_padding 27
	bspc config bottom_padding 5
	bspc config left_padding 0
	bspc config right_padding 0
	bspc config normal_border_color "#2f354b"
	bspc config focused_border_color "#181818"

	# wallpaper
	feh --bg-fill "$HOME"/.config/wallpaper-jpg/wall_0055.png

	# launcher bar
	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		(MONITOR=$mon polybar -q pam1 -c "$HOME"/.config/polybar/blocks/config.ini) &
		(MONITOR=$mon polybar -q pam2 -c "$HOME"/.config/polybar/blocks/config.ini) &
		(MONITOR=$mon polybar -q pam3 -c "$HOME"/.config/polybar/blocks/config.ini) &
		(MONITOR=$mon polybar -q pam4 -c "$HOME"/.config/polybar/blocks/config.ini) &
		(MONITOR=$mon polybar -q pam5 -c "$HOME"/.config/polybar/blocks/config.ini) &
		(MONITOR=$mon polybar -q pam6 -c "$HOME"/.config/polybar/blocks/config.ini) &
		(MONITOR=$mon polybar -q pam7 -c "$HOME"/.config/polybar/blocks/config.ini) &
	done

	# rofi Theme selector
	/bin/cat "$HOME/.config/polybar/blocks/rofi/launcher/launcher.sh" >"$HOME/.config/bspwm/scripts/rofiSelector.sh"

	#powermenu selector
	/bin/cat "$HOME/.config/polybar/blocks/rofi/poweroff/poweroff.sh" >"$HOME/.config/bspwm/scripts/powermenu.sh"
}

launch_forest() {

	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# wallpaper
	feh --bg-fill "$HOME"/.config/wallpaper-jpg/wall_0037.jpg

	# bspwm config
	bspc config border_width 2
	bspc config top_padding 35
	bspc config bottom_padding 5
	bspc config left_padding 0
	bspc config right_padding 0
	bspc config normal_border_color "#500075"
	bspc config focused_border_color "#ce30e6"

	# Launch the bar
	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q main -c ${HOME}/.config/polybar/forest/config.ini &
	done

	# rofi Selector
	/bin/cat "$HOME/.config/polybar/forest/scripts/launcher.sh" >"$HOME/.config/bspwm/scripts/rofiSelector.sh"

	# powermenu selector
	/bin/cat "$HOME/.config/polybar/forest/scripts/powermenu.sh" >"$HOME/.config/bspwm/scripts/powermenu.sh"
}

launch_windows() {

	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# wallpaper random
	feh -z --no-fehbg --bg-fill "$HOME"/.config/windows-walls/

	# bspwm config
	bspc config border_width 0
	bspc config top_padding 0
	bspc config bottom_padding 40
	bspc config left_padding 0
	bspc config right_padding 0

	# launcher bar
	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q main -c "$HOME"/.config/polybar/windows/windows.ini &
	done

	# rofi selector
	/bin/cat "$HOME/.config/polybar/windows/rofi/launcher/launcher.sh" >"$HOME/.config/bspwm/scripts/rofiSelector.sh"

	# powermenu selector
	/bin/cat "$HOME/.config/polybar/windows/rofi/poweroff/powermenu.sh" >"$HOME/.config/bspwm/scripts/powermenu.sh"

}

if [[ "$1" == "--colors" ]]; then
	launch_colors

elif [[ "$1" == "--blocks" ]]; then
	launch_blocks

elif [[ "$1" == "--arc" ]]; then
	launch_arc

elif [[ "$1" == "--forest" ]]; then
	launch_forest

elif [[ "$1" == "--windows" ]]; then
	launch_windows

else
	cat <<-EOF
		|-=-=--=-=-=-=-=-=-= Usage -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=|
		                                                                 
		           ./launch.sh --galaxi                         
		                                                                 
		|-=-=-=-=-=-=-=-=-=- Themes -=-=-=-=-=-=-=-=-=-=-=-=-=-=|
		                                                      
		   --arc  --blocks --colors --forest --windows        
		                                                       
		|--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=|

	EOF
fi
