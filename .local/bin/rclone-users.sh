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
    rclone sync $2 --log-file=rclone.log --exclude-from $HOME/.local/bin/rclone.exclude --delete-during --delete-excluded --ignore-errors --progress --skip-links $SRC_PATH $DST_PATH
    echo ""
	sleep 2
done
