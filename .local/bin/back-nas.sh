#!/bin/bash
#
# description: Use RSYNC to backup NAS shares

# Show arguments if none entered
if [ $# -eq 0 ]; then
    echo "Usage: `basename $0` DST_PATH [-n]"
    exit 0
fi

SRC=nas.local
read -sp "Enter password for NAS: " PASSWORD
echo

# URLencode password to avoid special character issues
PASSWORD=$(echo -ne "$PASSWORD" | xxd -plain | sed 's/\(..\)/%\1/g' )

# Sync Backup folders from NAS Backup volume
SRC_PATH=/tmp/$SRC
mkdir $SRC_PATH
mount -t smbfs //nas:$PASSWORD@$SRC/Backup $SRC_PATH
if [ $? -eq 0 ]; then
  for DIR in $SRC_PATH/* ; do
    DIR="${DIR##*/}"
    echo "Syncing volume: Backup/$DIR"
    rsync -rltvWh $2 --delete --modify-window=2 --exclude=.* $SRC_PATH/$DIR/ $1/Backup/$DIR
  done
  echo ""
  sleep 2
  diskutil unmount $SRC_PATH
  rmdir $SRC_PATH
else
  echo "Mount failed, scripted exiting"
  exit
fi

# Volumes to backup
PATHS=(Incoming Public)

for VOLUME in "${PATHS[@]}"; do
	echo "Syncing volume: $VOLUME"
	SRC_PATH=/tmp/$SRC
	mkdir $SRC_PATH
	mount -t smbfs //nas:$PASSWORD@$SRC/$VOLUME $SRC_PATH
	if [ $? -eq 0 ]; then
	  rsync -rltvWh $2 --delete --modify-window=2 --exclude=.* $SRC_PATH/ $1/$VOLUME
	  echo ""
	  sleep 2
	  diskutil unmount $SRC_PATH
	  rmdir $SRC_PATH
	else
	  echo "Mount failed, scripted exiting"
	  exit
	fi
done

