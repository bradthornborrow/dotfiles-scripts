#!/bin/bash

# Name to use for dconf settings file
HOST="$(hostname -s | tr '[:upper:]' '[:lower:]')"

case "$1" in
  "export")
    # Export dconf settings
    dconf dump / > $HOME/.config/dconf/$HOST.ini
    ;;
  "import")
    # Import dconf settings
    dconf load / < $HOME/.config/dconf/$HOST.ini
    ;;
  *)
    echo "Please specify 'export' or 'import' only."
    exit 1
    ;;
esac
