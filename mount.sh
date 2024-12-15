#!/usr/bin/env bash
# a script to mount my luks drive

enmount() {
    drives=$(lsblk -l | grep disk | grep -v nvme0n1 | awk '{print $1}')
    drive=$(printf "%s\n" "${drives[@]}" | rofi -dmenu -prompt="Drive:")
    [[ -z $drive ]] && exit 1
    sudo cryptsetup open /dev/$drive vault
    posmounts=$(find /mnt -maxdepth 3 2>/dev/null)
    mountpoint=$(printf "%s\n" "${posmounts[@]}" | rofi -dmenu -prompt="mount:")
    [[ -z $mountpoint ]] && exit 1
    sudo mount /dev/mapper/vault $mountpoint
}

enunmount() {
    mountpoints=$(find /mnt -maxdepth 3 2>/dev/null)
    MOUNTPOINT=$(printf "%s\n" "${mountpoints[@]}" | rofi -dmenu -prompt="Mountpoint:")
    [[ -z $MOUNTPOINT ]] && exit 1
    sudo umount $MOUNTPOINT
    sudo cryptsetup close vault
}

OPTIONS=("Mount" "Unmount")
OPTION=$(printf "%s\n" "${OPTIONS[@]}" | rofi -dmenu -prompt="Options:")
case $OPTION in
    "Mount")
	enmount
	;;
    "Unmount")
	enunmount
	;;
esac
