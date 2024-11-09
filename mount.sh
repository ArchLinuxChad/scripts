#!/usr/bin/env bash

function main {
    choices=("mount" "unmount")
    choice=$(printf "%s\n" "${choices[@]}" | dmenu -p "Action: ")
    [[ -z $choice ]] && exit 1
    case $choice in
        "mount")
            shmount
            ;;
        "unmount")
        shunmount
        ;;
    esac
}

function shmount {
   drives=$(lsblk -lp | grep "part $" | awk '{print $1}')
   dmount=$(printf "%s\n" "${drives[@]}" | dmenu -p "Drive to mount: ")
   [[ -z $dmount ]] && exit 1
   # directorys can be added
   dirs=$(find /mnt -maxdepth 3 2>/dev/null)

   mountpoint=$(printf "%s\n" "${dirs[@]}" | dmenu -p "Mounpoint: ")

   sudo mount $dmount $mountpoint
}

function shunmount {
   # I only mount drives to /mnt so only look there
   drives=$(lsblk -lp | grep "t /" | awk '{print $NF}' | grep "mnt")
   udrive=$(printf "%s\n" "${drives[@]}" | dmenu -p "Drives to unmount: ")
   [[ -z $udrive ]] && exit 1
   sudo umount $udrive
}

# run the script
main

}
