#!/usr/bin/env bash

configrepo="/home/$USER/.config"
dotsrepo="/home/$USER/nc/linux/dotfiles"

# backup files
cp /home/$USER/.bashrc $dotsrepo
cp /home/$USER/.bash_profile $dotsrepo
cp /home/$USER/.xinitrc $dotsrepo
cp /home/$USER/.vimrc $dotsrepo
cp /home/$USER/.emacs $dotsrepo
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
cp $configrepo/starship.toml $dotsrepo/.config/

notify-send "Script has finished"
