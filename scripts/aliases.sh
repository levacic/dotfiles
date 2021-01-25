if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    LS="ls"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    LS="gls"
fi

alias ll="${LS} -lv --almost-all --human-readable --color --group-directories-first"
alias gam='~/bin/gam/gam'
