#!/bin/bash
HOST="$(hostname -s | tr '[:upper:]' '[:lower:]')"

case "$1" in
  "backup")
    # Backup dconf settings
    dconf dump / > $HOME/.config/dconf/$HOST.ini
    ;;
  "restore")
    # Restore dconf settings
    dconf load / < $HOME/.config/dconf/$HOST.ini
    ;;
  *)
    echo "Please specify 'backup' or 'restore' only."
    exit 1
    ;;
esac
