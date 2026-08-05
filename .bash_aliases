#
# ~/.bash_aliases: this file is run by .bashrc if it exists
#
# Add alias for git dotfiles sync command
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Set vi as default text editor
export EDITOR=vim

# Add Generic Colorizer support
alias df='grc df -h'
alias du='grc du -h'
alias free='grc free -h'
alias ping='grc ping'
alias traceroute='grc traceroute'
alias ip='grc ip'
