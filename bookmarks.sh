#!/usr/bin/env bash

# define array

names=("google" "youtube" "gbnews" "classroom" "onenote")

declare -A bookmarks

#define bookmarks
bookmarks[google]="https://google.com"
bookmarks[youtube]="https://youtube.com"
bookmarks[gbnews]="https://www.gbnews.com"
bookmarks[classroom]="https://classroom.google.com"
bookmarks[onenote]="https://onenote.com"

site=$(printf "%s\n" "${names[@]}" | dmenu -p "Bookmarks:") 

# open the site
[[ -z "$site" ]] && exit 0
surf ${bookmarks[$site]}
