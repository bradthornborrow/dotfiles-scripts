#!/bin/bash
#
# description: Use RSYNC to backup user home folder

# Show arguments if none entered
if [ $# -eq 0 ]; then
    echo "Usage: `basename $0` DST_PATH [-n]"
    exit 0
fi

echo "Syncing folder: /Users/$USER"
SRC_PATH=/Users/$USER
DST_PATH=$1/
rsync -rltvWh $2 --delete --exclude '.DS_Store' --exclude '.Trash*' --exclude 'Library/CloudStorage/ShellFish'  --modify-window=2 $HOME $DST_PATH
echo ""
