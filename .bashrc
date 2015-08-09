# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Add RVM to PATH for scripting, if available
if [ -d "$HOME/.rvm/bin" ] ; then
	PATH="$HOME/.rvm/bin:$PATH"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Configure the prompt, along with some git variables
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

PS1=""
PS1+="\n" # Always start the prompt in a new line
PS1+="\[\033[01;37m\][\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi)\[\033[1;37m\]] " # Add the execution status of the last command
PS1+="\[\033[01;37m\][\[\033[01;34m\]\D{%Y-%m-%d %H:%M:%S}\[\033[1;37m\]] " # Add the current datetime
PS1+="\[\e[1;32m\]\u@\h \[\e[1;33m\]\w\$(__git_ps1 \" (%s)\")\n\$\[\e[1;37m\] "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
