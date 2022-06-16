if [[ "$OSTYPE" == "darwin"* ]]; then
    # Configure GPG on macOS.
    export GPG_TTY=`tty`
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Do nothing on Linux.
fi
