#
# ~/.bash_aliases: this file is run by .bashrc if it exists
#
# Add alias for git dotfiles sync command
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Set vi as default text editor
export EDITOR=vi

# Default pfetch setup
export BF_INFO="ascii host os kernel memory pkgs uptime palette"
