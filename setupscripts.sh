#!/bin/bash

if [[ ! -d /home/$USER/.local/bin ]]; then
	mkdir /home/$USER/.local/bin
fi

cp bar.sh /home/$USER/.local/bin/bar
cp updatebar.sh /home/$USER/.local/bin/updatebar
cp incvol.sh /home/$USER/.local/bin/incvol
cp decvol.sh /home/$USER/.local/bin/decvol
cp dots.sh /home/$USER/.local/bin/dots
cp power.sh /home/$USER/.local/bin/power
cp ddb.sh /home/$USER/.local/bin/ddb
cp backupdots.sh /home/$USER/.local/bin/backupdots
cp lock.sh /home/$USER/.local/bin/lock
cp mount.sh /home/$USER/.local/bin/mt
cp wiki.sh /home/$USER/.local/bin/wiki
