#!/usr/bin/env bash

options=("Suspend" "Reboot" "Shutdown")

selection=$(printf "%s\n" "${options[@]}" | dmenu)

if [[ "$selection" == "Suspend" ]]; then
	systemctl suspend
elif [[ "$selection" == "Reboot" ]]; then
	reboot
elif [[ "$selection" == "Shutdown" ]]; then
	shutdown now
fi
