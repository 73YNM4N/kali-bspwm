#!/bin/bash

C=$(printf '\033')
RED="${C}[1;31m"
SED_RED="${C}[1;31m&${C}[0m"
GREEN="${C}[1;32m"
SED_GREEN="${C}[1;32m&${C}[0m"
YELLOW="${C}[1;33m"
SED_YELLOW="${C}[1;33m&${C}[0m"
BLUE="${C}[1;34m"
SED_BLUE="${C}[1;34m&${C}[0m"
LIGHT_MAGENTA="${C}[1;95m"
SED_LIGHT_MAGENTA="${C}[1;95m&${C}[0m"
LIGHT_CYAN="${C}[1;96m"
SED_LIGHT_CYAN="${C}[1;96m&${C}[0m"

73YNM4N() {
  echo -en "
 ${BLUE} 
███████╗██████╗░██╗░░░██╗███╗░░██╗███╗░░░███╗░░██╗██╗███╗░░██╗ 
╚════██║╚════██╗╚██╗░██╔╝████╗░██║████╗░████║░██╔╝██║████╗░██║  
░░░░██╔╝░█████╔╝░╚████╔╝░██╔██╗██║██╔████╔██║██╔╝░██║██╔██╗██║  
░░░██╔╝░░╚═══██╗░░╚██╔╝░░██║╚████║██║╚██╔╝██║███████║██║╚████║  
░░██╔╝░░██████╔╝░░░██║░░░██║░╚███║██║░╚═╝░██║╚════██║██║░╚███║  
░░╚═╝░░░╚═════╝░░░░╚═╝░░░╚═╝░░╚══╝╚═╝░░░░░╚═╝░░░░░╚═╝╚═╝░░╚══╝${SED_BLUE}
${LIGHT_MAGENTA}
██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██╗░░░░░███████╗██████╗░
██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░██╔════╝██╔══██╗
██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░█████╗░░██████╔╝
██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░██╔══╝░░██╔══██╗
██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗███████╗██║░░██║
╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝${SED_LIGHT_MAGENTA}
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
                                                                                                                                                              
${SED_LIGHT_CYAN}                                                                                          
  "
}

install_icon() {
  echo -ne "
╦┌┐┌┌─┐┌┬┐┌─┐┬  ┬  ┬┌┐┌┌─┐     
║│││└─┐ │ ├─┤│  │  │││││ ┬     
╩┘└┘└─┘ ┴ ┴ ┴┴─┘┴─┘┴┘└┘└─┘
"
}

root_check() {
  if [ "$(id -u)" = 0 ]; then
    echo "${GREEN}[+] --${SED_GREEN}${RED} "this scritp not br run as root user"${SED_RED}"
    exit 1
  fi

  if [ "$PWD" != "$HOME" ]; then
    echo "${YELLOW} "script must be executed from HOME directory"${SED_YELLOW}"
    exit 1
  fi
}

install_dependencies() {
  clear
  73YNM4N
  echo "${GREEN}[+] --${SED_GREEN} Instalando paquetes..."
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

  if [ "$USER" == "root" ]; then
    echo -n "${GREEN}[+] -- ${SED_GREEN} Error: No ejecute este script como root."
    return 1
  fi

  echo "[+]--- Instalando paquetes:"
  for package in "${dependencies[@]}"; do
    echo "${GREEN}[+] -- ${SED_GREEN} ${YELLOW} ${install_icon} ${SED_YELLOW} $package"
  done

  if sudo apt install -y "${dependencies[@]}"; then
    echo "${GREEN}[+] --${SED_GREEN} ${YELLOW} Install complete ${SED_YELLOW}"
  else
    echo "${GREEN}[+] --${SED_GREEN} ${RED}Error: La instalación falló.${SED_RED}"
    return 1
  fi
}

download_repository() {
  clear
  icon
  echo "${GREEN}[+] --${SED_GREEN} ${RED} ${install_icon} repository bspwm-kali  ${SED_RED}"
  git clone https://github.com/73YNM4N/kali-bspwm.git

}

download_p10k() {
  clear
  icon
  echo "${GREEN}[+] --${SED_GREEN} ${RED} ${install_icon} powerlevel10k ${SED_RED}"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

}

download_astrovim() {
  clear
  icon
  echo "${GREEN}[+] --${SED_GREEN} ${RED} Download astrovim ${SED_RED}"
  git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
  rm -rf ~/.config/nvim/.git

}

permissions() {
  clear
  icon
  archivos=(
    "${HOME}/bspwm-kali/config/bspwm/bspwmrc"
    "${HOME}/bspwm-kali/config/bspwm/scripts/powermenu.sh"
    "${HOME}/bspwm-kali/config/bspwm/scripts/rofiSelector.sh"
    "${HOME}/bspwm-kali/config/bspwm/scripts/ThemeSelector/selectorTheme.sh"
    "${HOME}/bspwm-kali/config/bspwm/scripts/WallSelect.sh"
    "${HOME}/bspwm-kali/config/polybar/windows/rofi/poweroff/powermenu.sh"
    "${HOME}/bspwm-kali/config/polybar/windows/rofi/launcher/launcher.sh"
    "${HOME}/bspwm-kali/config/polybar/blocks/rofi/poweroff/poweroff.sh"
    "${HOME}/bspwm-kali/config/polybar/blocks/rofi/launcher/launcher.sh"
    "${HOME}/bspwm-kali/config/polybar/forest/scripts/powermenu.sh"
    "${HOME}/bspwm-kali/config/polybar/forest/scripts/launcher.sh"
    "${HOME}/bspwm-kali/config/polybar/scripts/vpn.bash"
    "${HOME}/bspwm-kali/config/polybar/scripts/get_spotify_status.sh"
    "${HOME}/bspwm-kali/config/polybar/launch.sh"
    "${HOME}/bspwm-kali/config/polybar/colors/rofi/poweroff/poweroff.sh"
    "${HOME}/bspwm-kali/config/polybar/colors/rofi/launcher/launcher.sh"
    "${HOME}/bspwm-kali/config/polybar/arc/rofi/poweroff/poweroff_arc.sh"
    "${HOME}/bspwm-kali/config/polybar/arc/rofi/launcher/launcher_arc.sh"
  )

  for archivo in "${archivos[@]}"; do
    chmod +x "$archivo"
    echo "${GREEN}[+] --${SED_GREEN} ${RED}Privileges assigned to: ${SED_RED} $archivo"
  done

}

config_Set() {
  clear
  icon
  if [ "$PWD" != "${HOME}/bspmw-kali" ]; then
    echo "${GREEN}[+] --${SED_GREEN} ${RED} moving config a your .config ${SED_RED}"
    cd "${HOME}"/kali-bspwm/
    cp config/* "${HOME}"/.config/ -rf
  fi

}

config_fonts() {
  clear
  icon
  if [ "$PWD" != "${HOME}/bspmw-kali" ]; then
    cd "${HOME}"/kali-bspwm
    echo "${GREEN}[+] --${SED_GREEN} ${RED} moving fonts a /usr/share/fonts ${SED_RED}"
    sudo cp fonts/* /usr/share/fonts -rf
    exit
  fi

}

config_home() {
  clear
  icon
  if [ "$PWD" != "${HOME}/bspmw-kali" ]; then
    cd "${HOME}"/kali-bspwm
    echo "${GREEN}[+] --${SED_GREEN} ${RED} moving .zshrc and .p10k a your ${HOME} ${SED_RED}"
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
