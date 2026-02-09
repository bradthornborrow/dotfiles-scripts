#!/bin/bash
#
# description: Use RSYNC to backup selected local user folders

# Show arguments if none entered
if [ $# -eq 0 ]; then
    echo "Usage: `basename $0` DST_PATH [-n]"
    exit 0
fi

# List of user home folders for backup
echo "Syncing folder: $HOME"
# rsync -rltvWh $2 --delete --exclude '*cache*/' --exclude '*Cache*/' --exclude '.DS_Store' --exclude '.Trash/' --exclude 'Library/CloudStorage/ShellFish'  --modify-window=2 $HOME/ $1$HOME
rclone sync $2 --exclude '*cache*/' --exclude '*Cache*/' --exclude '.DS_Store' --exclude '.Trash/' --exclude 'Library/CloudStorage/ShellFish' --modify-window=2 --multi-thread-streams=4 -P -L --metadata $HOME/ $1$HOME
echo ""
