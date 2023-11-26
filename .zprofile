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

# Add alias for git dotfiles sync command
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Add aliases for Python3
alias python="/usr/bin/python3"
alias pip="/usr/bin/pip3"

# Default pfetch setup
export PF_INFO="ascii host os kernel memory pkgs shell uptime palette"
