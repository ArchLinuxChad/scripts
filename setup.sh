#!/bin/bash

trap SIGINT "exit"

# define variables
HOMEDIR="/home/$USER"
GITREPO="home/$USER/github-repos"
DEPS="emacs hyprland hyprpaper wofi alacritty waybar nm-applet htop fish"

exit() {
    whiptail --yesno "Quiting now could break you system, Exit?" 0 0
    if [[ "$?" -eq 0 ]]; then
	exit 0
    fi
}

install_deps() {
  sudo dnf install $1 -y
}

clone_dotsfiles() {
  git clone https://github.com/ArchLinuxChad/dotfiles.git
}

place_dotfiles() {
  cd $GITREPO/dotfiles 
  cp .emacs $HOMEDIR
  cp -r .config/* $HOMEDIR/.config/
}

clone_scripts() {
  git clone https://github.com/ArchLinuxChad/scripts.git
}

disk_check() {
  SPACE=$(df -h | grep "/$" | awk '{print $4}' | sed 's/G//')
  [[ "$SPACE" -ln 5 ]] && echo "You do not have enough disk space" && exit 1
}

firewall() {
    sudo systemctl disable firewalld --now
    sudo dnf remove firewalld -y
    sudo dnf install ufw -y
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo systemctl enable ufw --now
    sudo ufw enable
}

setup_fish() {
    chsh -s /usr/bin/fish
}

install_font() {
    mkdir ~/.local/share/fonts
    cd ~/.local/share/fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/SpaceMono.zip
    unzip SpaceMono.zip
    rm OFL.txt
    rm README.md
    fc-cache -vf 
}

# check if there is enough disk space
disk_check

# create and build suckless apps
cd $HOMEDIR

# if git dierectory does not exist create it
[[ ! -d $HOMEDIR/$GITREPO ]] && mkdir $HOMEDIR/$GITREPO

# clone scripts and dotfile
cd $GITREPO
clone_dotfiles
place_dotfiles
clone_scripts
# place scripts in /usr/local/bin
cd $GITREPO/scripts
./setupscripts.sh &

# rip out gdm and replace with .xinitrc
sudo systemctl disable gdm.service

# setup the firewall
firewall

# install font
install_font
