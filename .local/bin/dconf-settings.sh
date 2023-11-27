#!/bin/bash

case "$1" in
  "backup")
    # Backup Gnome settings
    dconf dump / > $HOME/.config/dconf/dconf-settings.ini
    ;;
  "restore")
    # Restore Gnome settings
    dconf load / < $HOME/.config/dconf/dconf-settings.ini
    ;;
  *)
    echo "Please specify 'backup' or 'restore' only."
    exit 1
    ;;
esac
