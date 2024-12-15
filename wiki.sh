#!/usr/bin/env bash

wikipath="/usr/share/doc/arch-wiki/html/en/"

choice=$(find /usr/share/doc/arch-wiki/html/en/ *.html | awk -F "/" '{print $NF}' | sed -e 's/.html//g' -e 's/_/ /g' | rofi -dmenu -l 20 -p "Arch Wiki: " -i -sb purple -nb '#282A36' -fn 11)

if [[ "$choice" ]]; then
    article=$(echo $choice.html | sed 's/ /_/g')
	firefox $wikipath$article
fi
