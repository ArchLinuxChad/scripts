#!/usr/bin/env bash

configrepo="/home/$USER/.config"
dotsrepo="/home/$USER/nc/linux/dotfiles"

# backup files
rm -rf $dotsrepo/*
cp /home/$USER/.xinitrc $dotsrepo/
cp /home/$USER/.zshrc $dotsrepo/
cp /home/$USER/.zprofile $dotsrepo/
# back up .config
cp -r $configrepo/dunst $dotsrepo/.config/
cp -r $configrepo/fastfetch $dotsrepo/.config/
cp -r $configrepo/kitty $dotsrepo/.config/
cp -r $configrepo/picom $dotsrepo/.config/
cp -r $configrepo/fish $dotsrepo/.config/
cp -r $configrepo/hypr $dotsrepo/.config/
cp -r $configrepo/waybar $dotsrepo/.config/
cp -r $configrepo/wofi $dotsrepo/.config/
cp -r $configrepo/alacritty $dotsrepo/.config/
cp -r $configrepo/herbstluftwm $dotsrepo/.config/
cp -r $configrepo/polybar $dotsrepo/.config/
cp -r $configrepo/awesome $dotsrepo/.config/
cp $configrepo/starship.toml $dotsrepo/.config/
cp $configrepo/user-dirs.dirs $dotsrepo/.config/

notify-send "Script has finished"
