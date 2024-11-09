#!/bin/bash

scriptsdir="/home/$USER/github-repos/scripts"

files=$(command ls $scriptsdir)

SCRIPTS=()

for file in ${files}; do
	if [[ -z "$SCRIPTS" ]]; then
	 SCRIPTS[0]=$i
	else
		LEN=${#SCRIPTS[@]}
		INDEX=$(( LEN + 1 ))
		SCRIPTS[$INDEX]=$i
fi	
done

echo ${SCRIPTS[@]}
