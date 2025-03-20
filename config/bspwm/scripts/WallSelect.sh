#!/usr/bin/env bash

wall_dir="$HOME/.config/wallpaper-jpg/"
cacheDir="$HOME/.cache/$USER/$current_rice"
# Create cache dir if not exists
mkdir -p "${cacheDir}"

# Trying to adapt the images and menu to your screen resolution.
monitor_res=$(($(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f1) * 20 / $(xdpyinfo | awk '/resolution/{print $2}' | cut -d 'x' -f1)))
rofi_override="element-icon{size:${monitor_res}px;}"
rofi_command="rofi -dmenu -theme ./WallSelect.rasi -theme-str $rofi_override"

# Convert images in directory and save to cache dir
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
  [ -f "$imagen" ] || continue
  nombre_archivo=$(basename "$imagen")
  cache_file="${cacheDir}/${nombre_archivo}"
  md5_file="${cacheDir}/.${nombre_archivo}.md5"

  # Generar MD5 del archivo original
  current_md5=$(md5sum "$imagen" | cut -d' ' -f1)

  # Comprobar si el archivo de caché existe y si el contenido ha cambiado
  if [ ! -f "$cache_file" ] || [ ! -f "$md5_file" ] || [ "$current_md5" != "$(cat "$md5_file")" ]; then
    magick "$imagen" -resize 500x500^ -gravity center -extent 500x500 "$cache_file"
    echo "$current_md5" >"$md5_file"
  fi
done

# Launch rofi
wall_selection=$(find "${wall_dir}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A; do echo -en "$A\x00icon\x1f""${cacheDir}"/"$A\n"; done | $rofi_command)

# Set wallpaper
[[ -n "$wall_selection" ]] && feh --no-fehbg --bg-fill "${wall_dir}/${wall_selection}"
