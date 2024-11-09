#!/bin/bash

shmount() {
  drives=$(lsblk -lp | grep "disk $" | grep -v "nvme0n1" | awk '{print $1}')
  DRIVE=$(printf "%s\n" "${drives[@]}" | dmenu -p "Drive to mount")
  DIRS=$(find /mnt -maxdepth 3 2>/dev/null)
  MOUNTPOINT=$(printf "%s\n" "${DIRS[@]}" | dmenu -p "Mountpoint")
  # decrypt drive
  sudo cryptsetup open $DRIVE vault 
  sudo mount /dev/mapper/vault $MOUNTPOINT
}

shunmount() {
  MOUNTS=$(lsblk -lp | grep "crypt" | awk '{print $NF}')
  UDRIVE=$(printf "%s\n" "${MOUNTS[@]}" | dmenu -p "Drive to unmount")
  sudo mount $UDRIVE
  sudo cryptsetup close vault
}


# choice for user to make
CHOICES=("mount" "unmount")
# let user make choice
CHOICE=$(printf "%s\n" "${CHOICES[@]}" | dmenu -p "Select an option")

# decide what to do after choice was made
[[ -z "$CHOICE" ]] && exit 0
[[ "$CHOICE" == "mount" ]] && shmount
[[ "$CHOICE" == "unmount" ]] && shunmount
