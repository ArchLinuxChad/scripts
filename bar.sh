#!/bin/sh

bar() {
	# give the time in a 24 hour format and date
	TIME=$(date "+%F (%A) %R")
	echo "$TIME"
	#put a divider in
	echo "|"
	
	# display battery percentage
	BATPERC=$(upower --dump | grep percentage | sed 1q | awk '{print $NF}')
	echo "Battery: $BATPERC"
	echo "|"
	# show volume percentage
	VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/\.//')
	echo "$VOL%"
}

# set the bar
while true; do
	xsetroot -name "$(bar | tr '\n' ' ')"
	
	sleep 1m
done
