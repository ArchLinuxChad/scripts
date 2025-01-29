#!/usr/bin/env bash

BAT=$(upower --dump | grep percentage | sed 1q | awk '{print $NF}')

echo " Battery" > /tmp/battery
echo "$BAT" >> /tmp/battery

notify-send "$(cat /tmp/battery)"
