#!/usr/bin/env bash

CURRENT=$(grep OF /home/$USER/.config/polybar/config.ini | awk '{print $3}')

NEW=$((CURRENT - 1))

sed -i "s/$CURRENT OF 100/$NEW OF 100/" /home/$USER/.config/polybar/config.ini
