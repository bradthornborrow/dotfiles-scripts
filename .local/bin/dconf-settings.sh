#!/bin/bash

case "$1" in
  "export")
    # Backup Gnome settings
    dconf dump / > $HOME/.config/dconf/dconf-settings.ini
    ;;
  "import")
    # Restore Gnome settings
    dconf load / < $HOME/.config/dconf/dconf-settings.ini
    ;;
  *)
    echo "Please specify 'export' or 'import' only."
    exit 1
    ;;
esac
