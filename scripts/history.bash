# Don't put duplicate lines or lines starting with space in the history. See
# bash(1) for more options.
export HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1),
export HISTSIZE=50000
export HISTFILESIZE=60000
