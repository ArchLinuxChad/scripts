#!/usr/bin/env bash

configrepo="/home/$USER/.config"
dotsrepo="/home/$USER/github-repos/dotfiles"

# backup files
cp /home/$USER/.bashrc $dotsrepo

# back up .config
cp -r $configrepo/dunst $dotsrepo/.config/
cp -r $configrepo/fastfetch $dotsrepo/.config/
cp -r $configrepo/kitty $dotsrepo/.config/
cp -r $configrepo/picom $dotsrepo/.config/
cp $configrepo/starship.toml $dotsrepo/.config/
