#!/bin/bash

lsblk
read -p "What drive to backup to?" drive

cd ~/
DATE=$(date +%F)
tar cvzf $DATE"_nextcloud".tar.gz ~/nc
sudo mv ~/$DATE"_nextcloud".tar.gz $drive

# back up gpg and passwords
sudo cp -r /home/$USER/.gnupg $drive
sudo cp -r /home/$USER/.password-store $drive
