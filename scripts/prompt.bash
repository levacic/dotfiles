# Prompt configuration
PS1=""
PS1+="\n" # Always start the prompt in a new line
PS1+="\[\033[01;37m\][\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi)\[\033[1;37m\]] " # Add the execution status of the last command
PS1+="\[\033[01;37m\][\[\033[01;34m\]\D{%Y-%m-%d %H:%M:%S}\[\033[1;37m\]] " # Add the current datetime
PS1+="\[\e[1;32m\]\u@\h \[\e[1;33m\]\w\$(__git_ps1 \" (%s)\")\n\$\[\e[1;37m\] "

export PS1
