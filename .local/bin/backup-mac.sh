#!/bin/bash
#
# description: Use RSYNC to backup selected local user folders

# Show arguments if none entered
if [ $# -eq 0 ]; then
    echo "Usage: `basename $0` DST_PATH [-n]"
    exit 0
fi

# List of user home folders to backup 
PATHS=( BFT )

for FOLDER in "${PATHS[@]}"; do
	echo "Syncing folder: $FOLDER"
	SRC_PATH=/Users/$FOLDER/
	DST_PATH=$1/Backup/$FOLDER
	rsync -rltvWh $2 --delete --exclude '.DS_Store' --exclude '.Trash*'  --modify-window=2 $SRC_PATH $DST_PATH
	echo ""
	sleep 2
done
