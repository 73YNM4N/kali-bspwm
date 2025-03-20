#!/bin/bash

RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[1;33m'
BLUE=$'\e[1;34m'
LIGHT_CYAN=$'\e[1;96m'
RESET=$'\e[0m'

73YNM4N() {
  echo -en "
${BLUE}
███████╗██████╗░██╗░░░██╗███╗░░██╗███╗░░░███╗░░██╗██╗███╗░░██╗░░░░░░██████╗░░██████╗██████╗░░██╗░░░░░░░██╗███╗░░░███╗
╚════██║╚════██╗╚██╗░██╔╝████╗░██║████╗░████║░██╔╝██║████╗░██║░░░░░░██╔══██╗██╔════╝██╔══██╗░██║░░██╗░░██║████╗░████║
░░░░██╔╝░█████╔╝░╚████╔╝░██╔██╗██║██╔████╔██║██╔╝░██║██╔██╗██║█████╗██████╦╝╚█████╗░██████╔╝░╚██╗████╗██╔╝██╔████╔██║
░░░██╔╝░░╚═══██╗░░╚██╔╝░░██║╚████║██║╚██╔╝██║███████║██║╚████║╚════╝██╔══██╗░╚═══██╗██╔═══╝░░░████╔═████║░██║╚██╔╝██║
░░██╔╝░░██████╔╝░░░██║░░░██║░╚███║██║░╚═╝░██║╚════██║██║░╚███║░░░░░░██████╦╝██████╔╝██║░░░░░░░╚██╔╝░╚██╔╝░██║░╚═╝░██║
░░╚═╝░░░╚═════╝░░░░╚═╝░░░╚═╝░░╚══╝╚═╝░░░░░╚═╝░░░░░╚═╝╚═╝░░╚══╝░░░░░░╚═════╝░╚═════╝░╚═╝░░░░░░░░╚═╝░░░╚═╝░░╚═╝░░░░░╚═╝  
 ${RESET} 
"
}

icon() {
  echo -ne "     
${LIGHT_CYAN}
                            _____ _______   ___   _ __  __ _  _   _   _    ___ _   _ ____ _____  _    _     _     _____ ____                                  
                           |___  |___ /\ \ / / \ | |  \/  | || | | \ | |  |_ _| \ | / ___|_   _|/ \  | |   | |   | ____|  _ \                                 
  _____ _____ _____ _____     / /  |_ \ \ V /|  \| | |\/| | || |_|  \| |   | ||  \| \___ \ | | / _ \ | |   | |   |  _| | |_) |  _____ _____ _____ _____ _____ 
 |_____|_____|_____|_____|   / /  ___) | | | | |\  | |  | |__   _| |\  |   | || |\  |___) || |/ ___ \| |___| |___| |___|  _ <  |_____|_____|_____|_____|_____|
                            /_/  |____/  |_| |_| \_|_|  |_|  |_| |_| \_|  |___|_| \_|____/ |_/_/   \_\_____|_____|_____|_| \_\                                
                                                                                                                                                              
${RESET}                                                                                          
  "
}

root_check() {
  if [ "$(id -u)" = 0 ]; then
    echo "${GREEN}[+] --${RESET}${RED} "this scritp not be run as root user"${RESET}"
    exit 1
  fi

  if [ "$PWD" != "$HOME" ]; then
    echo "${YELLOW} "script must be executed from HOME directory"${RESET}"
    exit 1
  fi
}

install_dependencies() {
  icon
  echo "${GREEN}[+] --${RESET} Instalando paquetes..."
  sudo apt update
  local dependencies=(
    build-essential git vim libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev
    libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev libuv1-dev
    cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev python3-xcbgen xcb-proto libxcb-image0-dev
    libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libpulse-dev libjsoncpp-dev libmpdclient-dev
    libcurl4-openssl-dev libnl-genl-3-dev kitty rofi feh xclip ranger i3lock-fancy scrot scrub wmname
    imagemagick cmatrix htop python3-pip procps tty-clock fzf lsd bat pamixer flameshot
    meson libxext-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-render-util0-dev libxcb-render0-dev
    libxcb-composite0-dev libxcb-present-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev
    libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
    alacritty neovim libnotify-bin thunar fastfetch npm x11-utils coreutils bspwm polybar sxhkd picom tmux zsh
  )
  echo "${GREEN}[+] -- ${RESET} Instalando paquetes:"
  for package in "${dependencies[@]}"; do
    echo "${GREEN}[+] -- ${RESET} ${YELLOW} package to install: ${RESET} $package"
  done

  sudo apt install -y "${dependencies[@]}" | while read line; do
    if [[ "$line" == "Installing"* ]]; then
      echo "${GREEN}[+] -- ${RESET} $line"
    fi
  done

  if [ $? -eq 0 ]; then
    echo "${GREEN}[+] --${RESET} ${YELLOW} Install complete ${RESET}"
  else
    echo "${RED}[-] -- Error: install error.${RESET}"
    return 1
  fi
}

download_repository() {
  icon
  echo "${GREEN}[+] --${RESET} ${RED} Download repository bspwm-kali  ${RESET}"
  git clone https://github.com/73YNM4N/kali-bspwm.git

}

download_p10k() {
  clear
  icon
  echo "${GREEN}[+] --${RESET} ${RED} Download powerlevel10k ${RESET}"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

}

download_astrovim() {
  clear
  icon
  echo "${GREEN}[+] --${RESET} ${RED} Download astrovim ${RESET}"
  git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
  rm -rf ~/.config/nvim/.git

}

permissions() {
  clear
  icon
  archivos=(
    "${HOME}/kali-bspwm/config/bspwm/bspwmrc"
    "${HOME}/kali-bspwm/config/bspwm/scripts/powermenu.sh"
    "${HOME}/kali-bspwm/config/bspwm/scripts/rofiSelector.sh"
    "${HOME}/kali-bspwm/config/bspwm/scripts/ThemeSelector/selectorTheme.sh"
    "${HOME}/kali-bspwm/config/bspwm/scripts/WallSelect.sh"
    "${HOME}/kali-bspwm/config/polybar/windows/rofi/poweroff/powermenu.sh"
    "${HOME}/kali-bspwm/config/polybar/windows/rofi/launcher/launcher.sh"
    "${HOME}/kali-bspwm/config/polybar/blocks/rofi/poweroff/poweroff.sh"
    "${HOME}/kali-bspwm/config/polybar/blocks/rofi/launcher/launcher.sh"
    "${HOME}/kali-bspwm/config/polybar/forest/scripts/powermenu.sh"
    "${HOME}/kali-bspwm/config/polybar/forest/scripts/launcher.sh"
    "${HOME}/kali-bspwm/config/polybar/scripts/vpn.bash"
    "${HOME}/kali-bspwm/config/polybar/scripts/get_spotify_status.sh"
    "${HOME}/kali-bspwm/config/polybar/launch.sh"
    "${HOME}/kali-bspwm/config/polybar/colors/rofi/poweroff/poweroff.sh"
    "${HOME}/kali-bspwm/config/polybar/colors/rofi/launcher/launcher.sh"
    "${HOME}/kali-bspwm/config/polybar/arc/rofi/poweroff/poweroff_arc.sh"
    "${HOME}/kali-bspwm/config/polybar/arc/rofi/launcher/launcher_arc.sh"
  )

  for archivo in "${archivos[@]}"; do
    chmod +x "$archivo"
    echo "${GREEN}[+] --${RESET} ${RED}Privileges assigned to: ${RESET} $archivo"
  done

}

config_Set() {
  clear
  icon
  if [ "$PWD" != "${HOME}/bspmw-kali" ]; then
    echo "${GREEN}[+] --${RESET} ${RED} moving config a your .config ${RESET}"
    cd "${HOME}"/kali-bspwm/
    cp config/* "${HOME}"/.config/ -rf
  fi

}

config_fonts() {
  clear
  icon
  if [ "$PWD" != "${HOME}/bspmw-kali" ]; then
    cd "${HOME}"/kali-bspwm
    echo "${GREEN}[+] --${RESET} ${RED} moving fonts a /usr/share/fonts ${RESET}"
    sudo cp fonts/* /usr/share/fonts -rf
    exit
  fi

}

config_home() {
  clear
  icon
  if [ "$PWD" != "${HOME}/bspmw-kali" ]; then
    cd "${HOME}"/kali-bspwm
    echo "${GREEN}[+] --${RESET} ${RED} moving .zshrc and .p10k a your ${HOME} ${RESET}"
    cp home/.zshrc "${HOME}/" -rf
    cp home/.p10k.zsh "${HOME}/" -rf
    exit
  fi

}

73YNM4N
root_check
install_dependencies
download_repository
download_p10k
download_astrovim
permissions
config_Set
config_fonts
config_home
