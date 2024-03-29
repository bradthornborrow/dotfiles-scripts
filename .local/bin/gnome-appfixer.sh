# Makes the GNOME Shell Apps Dashboard sort the apps into their
#   respective categories based on the FreeDesktop standard

# Licensed under the MIT License
# Copyright (c) 2017 Ben Godfrey

gsettings set org.gnome.shell app-picker-layout "[]"
gsettings reset-recursively org.gnome.desktop.app-folders

gsettings set org.gnome.desktop.app-folders folder-children "['accessories', 'console', 'games', 'media', 'network', 'office', 'system', 'tools']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/accessories/ name "Accessories"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/accessories/ categories "['Utility']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/console/ name "Console"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/console/ categories "['ConsoleOnly']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/games/ name "Games"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/games/ categories "['Game']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/media/ name "Media"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/media/ categories "['Graphics','AudioVideo','Audio']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/network/ name "Network"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/network/ categories "['Network']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/office/ name "Office"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/office/ categories "['Office']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/system/ name "System"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/system/ categories "['System','Settings']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/tools/ name "Tools"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/tools/ categories "['Development']"
