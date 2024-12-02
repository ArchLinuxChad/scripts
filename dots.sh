#!/bin/bash
HOMEDIR="/home/$USER"
CONFDIR="/home/$USER/.config"
SCRDIR="/home/$USER/github-repos/scripts"

dotfiles=("$CONFDIR/kitty/kitty.conf" "$HOMEDIR/dwm/config.h" "$HOMEDIR/st/config.h" "$HOMEDIR/slstatus/config.h" "$HOMEDIR/surf/config.h" "$CONFDIR/starship.toml" "$CONFDIR/rofi/config.rasi" "$CONFDIR/fastfetch/config.jsonc" "$CONFDIR/picom/picom.conf" "$SCRDIR/dots.sh" "$SCRDIR/bar.sh" "$SCRDIR/updatebar.sh" "$HOMEDIR/.bashrc" "$HOMEDIR/.xinitrc" "$HOMEDIR/.bash_profile")

dot=$(printf "%s\n" "${dotfiles[@]}" | fzf)

[[ -z "$dot" ]] && exit 0

vim "$dot"
