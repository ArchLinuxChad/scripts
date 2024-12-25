#!/usr/bin/env bash

SCRIPTDIR="/home/$USER/github-repos/scripts"
BINDIR="/home/$USER/.local/bin"

if [[ ! -d /home/$USER/.local/bin ]]; then
	mkdir /home/$USER/.local/bin
fi

cp $SCRIPTDIR/ddb.sh $BINDIR/ddb
cp $SCRIPTDIR/backupdots.sh $BINDIR/backupdots
cp $SCRIPTDIR/dots.sh $BINDIR/dots

notify-send "Scripts have been placed"
