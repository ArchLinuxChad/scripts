#!/usr/bin/env bash

CURRENT=$(grep OF /home/$USER/.config/polybar/config.ini | awk '{print $3}')

NEW=$((CURRENT + 1))

if [[ $NEW -eq 100 ]]; then
  sed -i "s/$CURRENT OF 100/Completed/" /home/$USER/.config/polybar/config.ini
else
  sed -i "s/$CURRENT OF 100/$NEW OF 100/" /home/$USER/.config/polybar/config.ini
fi
