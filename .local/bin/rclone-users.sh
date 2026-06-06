#!/bin/bash
#
# description: Use rclone to backup selected local user folders

# Show arguments if none entered
if [ $# -eq 0 ]; then
    echo "Usage: `basename $0` DST_PATH [-n]"
    exit 0
fi

# List of user home folders for backup
PATHS=( BFT Shared )
for FOLDER in "${PATHS[@]}"; do
	echo "Syncing folder: $FOLDER"
	SRC_PATH=/Users/$FOLDER/
	DST_PATH=$1/Users/$FOLDER
    rclone sync $2 --exclude '*cache*/' --exclude '*Cache*/' --exclude '.DS_Store' --exclude '.Trash/' --exclude 'Library/CloudStorage/ShellFish' --modify-window=2s --multi-thread-streams=4 -P -L --metadata $SRC_PATH $DST_PATH
    echo ""
	sleep 2
done
