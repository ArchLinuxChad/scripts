#!/usr/bin/env bash

SCRIPTS=$(command ls /home/$USER/.local/bin)

SCRIPT=$(printf "%s\n" "${SCRIPTS[@]}" | rofi -dmenu -prompt "Script: ")

[[ -z $SCRIPT ]] && exit 0

bash /home/$USER/.local/bin/$SCRIPT
