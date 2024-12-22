#
# ~/.zprofile
#

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set vi as default text editor
export EDITOR=vi

# Add alias for git dotfiles sync command
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Default pfetch setup
export PF_INFO="ascii host os kernel memory pkgs shell uptime palette"

##
# Your previous /Users/BFT/.zprofile file was backed up as /Users/BFT/.zprofile.macports-saved_2024-12-22_at_10:59:16
##

# MacPorts Installer addition on 2024-12-22_at_10:59:16: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

