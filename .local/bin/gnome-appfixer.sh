# Makes the GNOME Shell Apps Dashboard sort the apps into their
#   respective categories based on the FreeDesktop standard

# Licensed under the MIT License
# Copyright (c) 2017 Ben Godfrey

gsettings set org.gnome.shell app-picker-layout "[]"

# gsettings reset-recursively org.gnome.desktop.app-folders
# gsettings set org.gnome.desktop.app-folders folder-children "['accessories', 'settings']"

# gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/accessories/ name "Accessories"
# gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/accessories/ categories "['Utility']"

# gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/settings/ name "Settings"
# gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/settings/ categories "['Settings','DesktopSettings']"
