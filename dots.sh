#!/bin/bash

dotfiles=("/home/$USER/.config/kitty/kitty.conf" "/home/$USER/dwm/config.h" "/home/$USER/st/config.h" "/home/$USER/slstatus/config.h" "/home/$USER/surf/config.h" "/home/$USER/.config/starship.toml" "/home/$USER/.config/rofi/config.rasi" "/home/$USER/.config/fastfetch/config.jsonc" "/home/$USER/.config/picom/picom.conf")

dot=$(printf "%s\n" "${dotfiles[@]}" | fzf)

[[ -z "$dot" ]] && exit 0

vim "$dot"
